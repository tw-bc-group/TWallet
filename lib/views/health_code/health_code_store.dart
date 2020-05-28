import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';

part 'health_code_store.g.dart';

enum FirstRefreshState {
  enabled,
  disabled,
}

class HealthCodeStore = HealthCodeStoreBase with _$HealthCodeStore;

abstract class HealthCodeStoreBase with Store {
  Stopwatch _stopwatch;
  Timer _timer;
  int countDown;
  int initialCountDown;
  final DID did;
  final _healthCertStore = getIt<HealthCertificationStore>();

  StreamController<ObservableFuture<void>> _fetchHealthCodeStreamController;
  ObservableStream<ObservableFuture<void>> fetchHealthCodeStream;

  HealthCodeStoreBase(
      this.did, this.initialCountDown, FirstRefreshState firstRefresh) {
    _fetchHealthCodeStreamController = StreamController();
    fetchHealthCodeStream = ObservableStream(
        _fetchHealthCodeStreamController.stream,
        initialValue: ObservableFuture(Future.value()));

    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (_stopwatch.isRunning) {
        updateElapsedSeconds();
      }

      if (currentCountDown == Optional.of(0)) {
        fetchLatestHealthCode();
      }
    });

    if (firstRefresh == FirstRefreshState.enabled) {
      fetchLatestHealthCode();
    } else {
      _startStopwatch();
    }
  }

  void _startStopwatch() {
    countDown = initialCountDown;
    _stopwatch
      ..reset()
      ..start();
  }

  void dispose() {
    _fetchHealthCodeStreamController.close();
    _stopwatch.stop();
    _timer.cancel();
  }

  @observable
  int elapsedSeconds = 0;

  @action
  void updateElapsedSeconds() {
    elapsedSeconds = _stopwatch.elapsed.inSeconds;
  }

  @computed
  Optional<int> get currentCountDown => _stopwatch.isRunning
      ? Optional.of(max(initialCountDown - elapsedSeconds, 0))
      : const Optional.empty();

  @action
  void fetchLatestHealthCode() {
    _stopwatch.stop();
    _fetchHealthCodeStreamController.add(
        ObservableFuture(_healthCertStore.fetchLatestHealthCert(did.toString()))
            .then((_) => _startStopwatch()));
  }
}

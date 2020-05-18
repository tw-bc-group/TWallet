import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/store/health_certification_store.dart';
import 'package:tw_wallet_ui/models/did.dart';

part 'health_code_store.g.dart';

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

  HealthCodeStoreBase(this.did, this.initialCountDown) {
    _fetchHealthCodeStreamController = StreamController();
    fetchHealthCodeStream = ObservableStream(
        _fetchHealthCodeStreamController.stream,
        initialValue: ObservableFuture(Future.value()));

    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (_stopwatch.isRunning) {
        updateElapsedSeconds();
      }

      if (currentCountDown == Optional.of(0)) {
        fetchLatestHealthCode();
      }
    });

    _stopwatch = Stopwatch()..start();
  }

  void dispose() {
    _fetchHealthCodeStreamController.close();
    _stopwatch.stop();
    _timer.cancel();
  }

  @observable
  int elapsedSeconds = 0;

  @action
  updateElapsedSeconds() {
    elapsedSeconds = _stopwatch.elapsed.inSeconds;
  }

  @computed
  Optional<int> get currentCountDown => _stopwatch.isRunning
      ? Optional.of(max(initialCountDown - elapsedSeconds, 0))
      : Optional.empty();

  @action
  fetchLatestHealthCode() {
    _stopwatch.stop();
    _fetchHealthCodeStreamController.add(
        ObservableFuture(_healthCertStore.fetchLatestHealthCert(did.toString()))
            .then((_) {
      countDown = initialCountDown;
      _stopwatch
        ..reset()
        ..start();
    }));
  }
}

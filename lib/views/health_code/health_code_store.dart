import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';

part 'health_code_store.g.dart';

enum FirstRefreshState {
  enabled,
  disabled,
}

class HealthCodeStore = HealthCodeStoreBase with _$HealthCodeStore;

abstract class HealthCodeStoreBase with Store {
  late Stopwatch _stopwatch;
  late Timer _timer;

  int initialCountDown;
  final DID did;
  final _healthCertStore = Get.find<HealthCertificationStore>();

  late final StreamController<ObservableFuture<void>>
      _fetchHealthCodeStreamController;
  late final ObservableStream<ObservableFuture<void>> fetchHealthCodeStream;

  HealthCodeStoreBase({
    required this.did,
    required this.initialCountDown,
    required FirstRefreshState firstRefresh,
  }) {
    _fetchHealthCodeStreamController = StreamController();
    fetchHealthCodeStream = ObservableStream(
      _fetchHealthCodeStreamController.stream,
      initialValue: ObservableFuture(Future.value()),
    );

    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (_stopwatch.isRunning) {
        currentCountDown =
            max(initialCountDown - _stopwatch.elapsed.inSeconds, 0);

        if (currentCountDown == 0) {
          fetchLatestHealthCode();
        }
      }
    });

    if (firstRefresh == FirstRefreshState.enabled) {
      fetchLatestHealthCode();
    } else {
      _startStopwatch();
    }
  }

  void _startStopwatch() {
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
  int? currentCountDown;

  @action
  void fetchLatestHealthCode() {
    _stopwatch.stop();
    _fetchHealthCodeStreamController.add(
      ObservableFuture(_healthCertStore.fetchLatestHealthCert(did.toString()))
          .then((_) => _startStopwatch()),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';

part 'health_code_store.g.dart';

enum FirstRefreshState {
  enabled,
  disabled,
}

class HealthCodeStore = HealthCodeStoreBase with _$HealthCodeStore;

abstract class HealthCodeStoreBase with Store {
  Stopwatch? _stopwatch;
  Timer? _timer;
  int? initialCountDown;
  final DID? did;
  final _healthCertStore = Get.find<HealthCertificationStore>();

  StreamController<ObservableFuture<void>>? _fetchHealthCodeStreamController;
  ObservableStream<ObservableFuture<void>>? fetchHealthCodeStream;

  HealthCodeStoreBase(
      this.did, this.initialCountDown, FirstRefreshState firstRefresh) {
    _fetchHealthCodeStreamController = StreamController();
    fetchHealthCodeStream = ObservableStream(
      _fetchHealthCodeStreamController!.stream,
      initialValue: ObservableFuture(Future.value()),
    );

    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (_stopwatch!.isRunning) {
        currentCountDown = Optional.of(
          max(initialCountDown! - _stopwatch!.elapsed.inSeconds, 0),
        );

        if (currentCountDown == Optional.of(0)) {
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
    _stopwatch!
      ..reset()
      ..start();
  }

  void dispose() {
    _fetchHealthCodeStreamController!.close();
    _stopwatch!.stop();
    _timer!.cancel();
  }

  @observable
  Optional<int> currentCountDown = const Optional.empty();

  @action
  void fetchLatestHealthCode() {
    _stopwatch!.stop();
    _fetchHealthCodeStreamController!.add(
      ObservableFuture(_healthCertStore.fetchLatestHealthCert(did.toString()))
          .then((_) => _startStopwatch()),
    );
  }
}

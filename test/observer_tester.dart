import 'package:flutter/material.dart';

typedef OnObservation = void Function(
  Route<dynamic>? route,
  Route<dynamic>? previousRoute,
);

/// A trivial observer for testing the navigator.
class TestObserver extends NavigatorObserver {
  OnObservation? onPushed;
  OnObservation? onPopped;
  OnObservation? onRemoved;
  OnObservation? onReplaced;
  OnObservation? onStartUserGesture;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPushed?.call(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPopped?.call(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onRemoved?.call(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? oldRoute, Route<dynamic>? newRoute}) {
    onReplaced?.call(newRoute, oldRoute);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    onStartUserGesture?.call(route, previousRoute);
  }
}

class NavigatorObservation {
  const NavigatorObservation({
    this.previous,
    this.current,
    required this.operation,
  });
  final String? previous;
  final String? current;
  final String operation;

  @override
  String toString() => 'NavigatorObservation($operation, $current, $previous)';
}

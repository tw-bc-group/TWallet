import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/main.dart';
import 'package:tw_wallet_ui/router/routers.dart';

import '../../observer_tester.dart';

void main() {
  testWidgets('should jump to restore wallet page', (tester) async {
    final List<NavigatorObservation> observations = <NavigatorObservation>[];

    final TestObserver observer = TestObserver()
      ..onPushed = (Route<dynamic>? route, Route<dynamic>? previousRoute) {
        // Pushes the initial route.
        observations.add(
          NavigatorObservation(
            current: route?.settings.name,
            previous: previousRoute?.settings.name,
            operation: 'push',
          ),
        );
      };
    await tester.pumpWidget(
      TWallet(
        initialRoute: Routes.newWallet,
        navigatorObservers: [observer],
      ),
    );
    await tester.pump();

    await tester.tap(find.text('恢复钱包'));

    await tester.pumpAndSettle();

    expect(observations.length, 3);
    expect(observations[2].operation, 'push');
    expect(observations[2].current, Routes.restoreMnemonics);
    expect(observations[2].previous, Routes.newWallet);
  });
}

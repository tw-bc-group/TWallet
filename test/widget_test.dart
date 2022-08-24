// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:mockito/annotations.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';

import 'package:tw_wallet_ui/main.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/magic_link.dart';
import 'package:tw_wallet_ui/views/input_pin/input_pin_widget.dart';

import 'observer_tester.dart';

import 'widget_test.mocks.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateMocks([SecureStorage])
void main() {
  testWidgets('Landing page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      TWallet(
        initialRoute: Routes.inputPin,
      ),
    );

    expect(find.text('请创建您的 PIN 码'), findsOneWidget);
  });

  testWidgets('input pin smoke test', (tester) async {
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

    final ctl1 = TextEditingController();
    final ctl2 = TextEditingController();

    final Handler mockHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return PinInputWidget(ctl1, ctl2);
      },
    );
    Routes.routers[Routes.inputPin] = mockHandler;
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      TWallet(
        initialRoute: Routes.inputPin,
        navigatorObservers: [observer],
      ),
    );

    ctl1.text = '123456';
    ctl2.text = '123456';

    await tester.pump();
    final list = find.byType(ListView);
    final scrollable = find.byWidgetPredicate((w) => w is Scrollable);
    final scrollableOfList = find.descendant(of: list, matching: scrollable);

    await tester.scrollUntilVisible(
      find.text('下一步'),
      200.0,
      scrollable: scrollableOfList.first,
    );

    expect(find.text('下一步'), findsOneWidget);

    Get.put<SecureStorage>(MockSecureStorage());
    Get.put<Magic>(magicLink());
    await tester.tap(find.text('下一步'));
    await tester.pump();

    expect(observations.length, 3);
    expect(observations[2].operation, 'push');
    expect(observations[2].current, Routes.newWallet);
    expect(observations[2].previous, Routes.inputPin);
  });
}

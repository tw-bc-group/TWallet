import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/main.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/magic_link.dart';

void main() {
  testWidgets('show login page properly', (WidgetTester tester) async {
    Get.put(magicLink());
    await tester.pumpWidget(TWallet(initialRoute: Routes.magicLinkLogin));

    await tester.pump();
    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('should show login verification message', (tester) async {
    Get.put(magicLink());
    await tester.pumpWidget(TWallet(initialRoute: Routes.magicLinkLogin));
    await tester.pump();
    await tester.enterText(find.byType(TextField), '111@1.com');
    await tester.tap(find.text('Login'));

    await tester.pump();

    expect(find.text('Check your email'), findsOneWidget);
  });
}

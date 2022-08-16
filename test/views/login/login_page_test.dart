import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/views/login/login_page.dart';

void main() {
  testWidgets('show login page properly', (WidgetTester tester) async {
    await tester.pumpWidget(LoginPage());

    // expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/main.dart';
import 'package:tw_wallet_ui/router/routers.dart';

void main() {
  testWidgets('show login page properly', (WidgetTester tester) async {
    await tester.pumpWidget(TWallet(initialRoute: Routes.web3authLogin));

    expect(find.text('Login with Google'), findsOneWidget);
    expect(find.text('Login with Facebook'), findsOneWidget);
    expect(find.text('Login with Github'), findsOneWidget);

  });
}

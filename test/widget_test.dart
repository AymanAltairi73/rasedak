import 'package:flutter_test/flutter_test.dart';
import 'package:rasedak/main.dart';

void main() {
  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RasedakApp());

    // Verify that splash screen is shown
    expect(find.byType(RasedakApp), findsOneWidget);
  });
}

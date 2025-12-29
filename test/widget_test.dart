// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:taxi_tera/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TaxiTeraApp());

    // Verify that our app starts correctly
    expect(find.text('TAXI TERA'), findsOneWidget);
  });
}
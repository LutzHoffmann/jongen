import 'package:flutter_test/flutter_test.dart';
import 'package:jongen/app.dart';

void main() {
  testWidgets('starts the Jongen customer app', (WidgetTester tester) async {
    await tester.pumpWidget(JongenApp());

    expect(find.text('Jongen'), findsWidgets);
    expect(find.text('Customer App'), findsOneWidget);
  });
}

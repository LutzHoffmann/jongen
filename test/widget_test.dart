import 'package:flutter_test/flutter_test.dart';
import 'package:jongen/app.dart';
import 'package:jongen/startup/load_initial_data.dart';

void main() {
  test('loadInitialData runs both loaders in order when they succeed', () async {
    final calls = <String>[];
    final logs = <String>[];

    await loadInitialData(
      loadGeo: () async {
        calls.add('geo');
      },
      loadCutpara: () async {
        calls.add('cutpara');
      },
      onError: (label, error, stackTrace) {
        logs.add('$label:$error');
      },
    );

    expect(calls, ['geo', 'cutpara']);
    expect(logs, isEmpty);
  });

  test('loadInitialData continues after geo loader failure', () async {
    final calls = <String>[];
    final logs = <String>[];

    await loadInitialData(
      loadGeo: () async {
        calls.add('geo');
        throw Exception('geo failed');
      },
      loadCutpara: () async {
        calls.add('cutpara');
      },
      onError: (label, error, stackTrace) {
        logs.add('$label:$error');
      },
    );

    expect(calls, ['geo', 'cutpara']);
    expect(logs, hasLength(1));
    expect(logs.single, contains('geo'));
  });

  test('loadInitialData keeps going when both loaders fail', () async {
    final calls = <String>[];
    final logs = <String>[];

    await loadInitialData(
      loadGeo: () async {
        calls.add('geo');
        throw Exception('geo failed');
      },
      loadCutpara: () async {
        calls.add('cutpara');
        throw Exception('cutpara failed');
      },
      onError: (label, error, stackTrace) {
        logs.add('$label:$error');
      },
    );

    expect(calls, ['geo', 'cutpara']);
    expect(logs, hasLength(2));
    expect(logs.first, contains('geo'));
    expect(logs.last, contains('cutpara'));
  });

  testWidgets('starts the Jongen customer app', (WidgetTester tester) async {
    await tester.pumpWidget(JongenApp());

    expect(find.text('Jongen'), findsNWidgets(2));
    expect(find.text('Customer App'), findsOneWidget);
  });
}

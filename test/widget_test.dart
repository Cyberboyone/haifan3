import 'package:flutter_test/flutter_test.dart';

import 'package:malam_lawan_triumph3/main.dart';

void main() {
  testWidgets('App boots and shows the scholar header', (tester) async {
    await tester.pumpWidget(const IslamicAudioApp());

    expect(
      find.text('Malam Lawan Triumph 3'),
      findsOneWidget,
    );
  });
}
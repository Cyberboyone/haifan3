import 'package:flutter_test/flutter_test.dart';
import 'package:haifan_tafsir/main.dart';

void main() {
  testWidgets('App boots and shows the scholar header', (tester) async {
    await tester.pumpWidget(const IslamicAudioApp());
    expect(find.text("Shaikh Haifan Tafsir"), findsOneWidget);
  });
}
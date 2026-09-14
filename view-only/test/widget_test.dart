import 'package:app_view_only/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AQUA home renders core sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AquaApp());

    expect(find.text('Penuhi hidrasimu hari ini'), findsOneWidget);
    expect(find.text('Galon 19L'), findsOneWidget);
    expect(find.text('Pesan Sekarang'), findsOneWidget);
  });
}

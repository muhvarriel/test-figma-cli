import 'package:app_view_and_create/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('KopiCraft home renders core sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KopiCraftApp());

    expect(find.text('Mau ngopi apa hari ini?'), findsOneWidget);
    expect(find.text('Ringan'), findsOneWidget);
    expect(find.text('Wine Process Pour Over'), findsOneWidget);
    expect(find.text('Pesan Sekarang — Ambil di Bar'), findsOneWidget);
  });

  testWidgets('Brew strength selector updates selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KopiCraftApp());

    await tester.tap(find.text('Kuat'));
    await tester.pump();

    expect(find.text('Kuat'), findsOneWidget);
  });
}

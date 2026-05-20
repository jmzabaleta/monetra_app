import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monetra_app/main.dart';

void main() {
  testWidgets('Monetra renders the dashboard shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MonetraApp()));
    await tester.pumpAndSettle();

    expect(find.text('Monetra'), findsOneWidget);
    expect(find.text('Balance total'), findsOneWidget);
    expect(find.text('Movimientos'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wargaconnect/main.dart';
void main() {
  testWidgets('WargaConnect menampilkan halaman pilihan peran',
      (WidgetTester tester) async {
    await tester.pumpWidget(const WargaConnectApp());

    // Memastikan nama aplikasi dan pilihan peran tampil.
    expect(find.text('WargaConnect'), findsOneWidget);
    expect(find.text('Warga'), findsOneWidget);
    expect(find.text('Admin RT'), findsOneWidget);
  });
}

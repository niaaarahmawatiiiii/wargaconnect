import 'package:flutter/material.dart';
import 'providers/admin_auth.dart';
import 'screens/pilih_peran_screen.dart';
import 'screens/admin_login_screen.dart';
import 'screens/beranda_screen.dart';
import 'screens/informasi_screen.dart';
import 'screens/jadwal_screen.dart';
import 'screens/arsip_screen.dart';
import 'screens/admin_dashboard_screen.dart';

void main() {
  runApp(const WargaConnectApp());
}

class WargaConnectApp extends StatelessWidget {
  const WargaConnectApp({super.key});

  static const warnaUtama = Color(0xFF19745F);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WargaConnect',
      debugShowCheckedModeBanner: false,

      // Pengaturan tema utama aplikasi.
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: warnaUtama,
          primary: warnaUtama,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: warnaUtama),
          ),
        ),
      ),

      // Halaman pertama saat aplikasi dibuka.
      initialRoute: '/',

      // Daftar halaman aplikasi.
      routes: {
        '/': (context) => const PilihPeranScreen(),
        '/admin-login': (context) => const AdminLoginScreen(),
        '/home': (context) => const BerandaScreen(),
        '/informasi': (context) => const InformasiScreen(),
        '/jadwal': (context) => const JadwalScreen(),
        '/arsip': (context) => const ArsipScreen(),
      },

      // Melindungi halaman Dashboard Admin.
      onGenerateRoute: (settings) {
        if (settings.name == '/admin') {
          if (AdminAuth.isLoggedIn) {
            return MaterialPageRoute(
              builder: (context) =>
                  const AdminDashboardScreen(),
            );
          }

          return MaterialPageRoute(
            builder: (context) => const AdminLoginScreen(),
          );
        }

        return null;
      },
    );
  }
}

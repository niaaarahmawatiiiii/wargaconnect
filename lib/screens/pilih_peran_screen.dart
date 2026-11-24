import 'package:flutter/material.dart';

class PilihPeranScreen extends StatelessWidget {
  const PilihPeranScreen({super.key});

  static const warnaUtama = Color(0xFF19745F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ikon aplikasi.
                const Icon(
                  Icons.people_alt_rounded,
                  size: 85,
                  color: warnaUtama,
                ),

                const SizedBox(height: 15),

                const Text(
                  'WargaConnect',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: warnaUtama,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Aplikasi Informasi dan Layanan Warga',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),

                const SizedBox(height: 45),

                const Text(
                  'Masuk sebagai',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Tombol masuk sebagai warga.
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    },
                    icon: const Icon(Icons.people),
                    label: const Text('Warga'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: warnaUtama,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Tombol masuk sebagai Admin RT.
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/admin-login',
                      );
                    },
                    icon: const Icon(Icons.admin_panel_settings),
                    label: const Text('Admin RT'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: warnaUtama,
                      side: const BorderSide(color: warnaUtama),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

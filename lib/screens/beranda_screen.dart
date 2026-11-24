import 'package:flutter/material.dart';
import '../providers/info_provider.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/info_card.dart';
import 'detail_informasi_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  static const warnaUtama = Color(0xFF19745F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'WargaConnect',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: AnimatedBuilder(
        animation: infoProvider,
        builder: (context, child) {
          final data = infoProvider.pengumuman;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Selamat datang, Warga RT',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Informasi lingkungan dalam satu genggaman.',
                style: TextStyle(fontSize: 11),
              ),

              const SizedBox(height: 20),

              // Empat menu akses cepat.
              Row(
                children: [
                  _menuCepat(
                    context,
                    'Informasi',
                    Icons.article_outlined,
                    '/informasi',
                  ),
                  _menuCepat(
                    context,
                    'Jadwal',
                    Icons.calendar_month_outlined,
                    '/jadwal',
                  ),
                  _menuCepat(
                    context,
                    'Arsip',
                    Icons.archive_outlined,
                    '/arsip',
                  ),
                  _menuCepat(
                    context,
                    'Admin',
                    Icons.admin_panel_settings_outlined,
                    '/admin-login',
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'Informasi Terbaru',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 12),

              // Menampilkan maksimal tiga informasi terbaru.
              if (data.isEmpty)
                const Text('Belum ada informasi.'),

              ...data.take(3).map(
                (item) => InfoCard(
                  pengumuman: item,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailInformasiScreen(
                          pengumuman: item,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: const AppBottomNav(
        currentIndex: 0,
      ),
    );
  }

  // Widget menu akses cepat.
  Widget _menuCepat(
    BuildContext context,
    String judul,
    IconData ikon,
    String route,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
          decoration: BoxDecoration(
            border: Border.all(color: warnaUtama),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Icon(ikon, color: warnaUtama, size: 23),
              const SizedBox(height: 5),
              Text(
                judul,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

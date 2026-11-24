import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
  });

  // Daftar halaman navigasi warga.
  static const List<String> routes = [
    '/home',
    '/informasi',
    '/jadwal',
    '/arsip',
    '/',
  ];

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color(0xFF19745F);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: warnaUtama,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: (index) {
        // Tidak berpindah jika menu yang dipilih sedang aktif.
        if (index == currentIndex) return;

        // Menu Profil mengarahkan kembali ke halaman pilihan peran.
        if (index == 4) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (route) => false,
          );
          return;
        }

        Navigator.pushReplacementNamed(
          context,
          routes[index],
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Informasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Jadwal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.archive_outlined),
          label: 'Arsip',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
    );
  }
}

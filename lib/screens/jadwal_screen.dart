import 'package:flutter/material.dart';
import '../providers/info_provider.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/kegiatan_card.dart';

class JadwalScreen extends StatelessWidget {
  const JadwalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Jadwal Kegiatan'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: AnimatedBuilder(
        animation: infoProvider,
        builder: (context, child) {
          final data = infoProvider.kegiatan;

          if (data.isEmpty) {
            return const Center(
              child: Text('Belum ada jadwal kegiatan.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(14),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return KegiatanCard(
                kegiatan: data[index],
              );
            },
          );
        },
      ),

      bottomNavigationBar: const AppBottomNav(
        currentIndex: 2,
      ),
    );
  }
}

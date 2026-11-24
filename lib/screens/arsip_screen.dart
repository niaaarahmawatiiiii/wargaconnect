import 'package:flutter/material.dart';
import '../providers/info_provider.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/info_card.dart';
import '../widgets/kategori_chip.dart';
import 'detail_informasi_screen.dart';

class ArsipScreen extends StatefulWidget {
  const ArsipScreen({super.key});

  @override
  State<ArsipScreen> createState() => _ArsipScreenState();
}

class _ArsipScreenState extends State<ArsipScreen> {
  String kategoriTerpilih = 'Semua';

  final List<String> kategori = [
    'Semua',
    'RTRW',
    'PKK',
    'Posyandu',
    'Bansos',
  ];

  // Mengambil nama bulan dari tanggal informasi.
  String ambilBulan(String tanggal) {
    if (tanggal.contains('Sep')) return 'September 2026';
    if (tanggal.contains('Okt')) return 'Oktober 2026';
    if (tanggal.contains('Nov')) return 'November 2026';

    return 'Arsip Lainnya';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Arsip Informasi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: AnimatedBuilder(
        animation: infoProvider,
        builder: (context, child) {
          final data = infoProvider.arsip.where((item) {
            if (kategoriTerpilih == 'Semua') return true;

            return item.kategori == kategoriTerpilih;
          }).toList();

          // Mengelompokkan informasi berdasarkan bulan.
          final Map<String, List<dynamic>> kelompok = {};

          for (final item in data) {
            final bulan = ambilBulan(item.tanggal);
            kelompok.putIfAbsent(bulan, () => []);
            kelompok[bulan]!.add(item);
          }

          return Column(
            children: [
              SizedBox(
                height: 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: kategori.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: KategoriChip(
                        kategori: item,
                        terpilih: kategoriTerpilih == item,
                        onTap: () {
                          setState(() {
                            kategoriTerpilih = item;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),

              Expanded(
                child: data.isEmpty
                    ? const Center(
                        child: Text('Belum ada arsip informasi.'),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(12),
                        children: kelompok.entries.map((kelompokBulan) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Text(
                                  kelompokBulan.key,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),

                              ...kelompokBulan.value.map((item) {
                                return InfoCard(
                                  pengumuman: item,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            DetailInformasiScreen(
                                          pengumuman: item,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            ],
                          );
                        }).toList(),
                      ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: const AppBottomNav(
        currentIndex: 3,
      ),
    );
  }
}

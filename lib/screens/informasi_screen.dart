import 'package:flutter/material.dart';
import '../providers/info_provider.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/info_card.dart';
import '../widgets/kategori_chip.dart';
import 'detail_informasi_screen.dart';

class InformasiScreen extends StatefulWidget {
  const InformasiScreen({super.key});

  @override
  State<InformasiScreen> createState() => _InformasiScreenState();
}

class _InformasiScreenState extends State<InformasiScreen> {
  // Daftar kategori yang tersedia.
  final List<String> kategori = [
    'Semua',
    'RTRW',
    'PKK',
    'Posyandu',
    'Bansos',
  ];

  String kategoriTerpilih = 'Semua';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Informasi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: AnimatedBuilder(
        animation: infoProvider,
        builder: (context, child) {
          // Menyaring data berdasarkan kategori.
          final data = infoProvider.pengumuman.where((item) {
            if (kategoriTerpilih == 'Semua') return true;

            return item.kategori == kategoriTerpilih;
          }).toList();

          return Column(
            children: [
              // Pilihan kategori.
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

              // Daftar informasi.
              Expanded(
                child: data.isEmpty
                    ? const Center(
                        child: Text('Belum ada informasi pada kategori ini.'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];

                          return InfoCard(
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
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: const AppBottomNav(
        currentIndex: 1,
      ),
    );
  }
}

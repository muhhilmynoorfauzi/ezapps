import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  // Kategori aplikasi
  final Map<String, List<int>> kategoriHarga = {
    'Sistem Informasi': [10000, 20000],
    'Permainan': [10000, 20000],
    'Hiburan': [10000, 20000],
    'Sosial Media': [10000, 20000],
    'E-commerce': [10000, 20000],
    'Utilitas dan Alat': [10000, 20000],
    'Kesehatan dan Kebugaran': [10000, 20000],
    'Travel dan Navigasi': [10000, 20000],
    'Pendidikan dan Pembelajaran': [10000, 20000],
    'Produktivitas': [10000, 20000],
    'Fotografi dan Desain': [10000, 20000],
    'Keuangan dan Perbankan': [10000, 20000],
  };

  // Fitur aplikasi
  final Map<String, List<int>> fiturHarga = {
    'Autentikasi Pengguna': [10000, 20000],
    'Beranda (Home)': [10000, 20000],
    'Profil Pengguna': [10000, 20000],
    'Notifikasi': [10000, 20000],
    'Pencarian': [10000, 20000],
    'Integrasi Media Sosial': [10000, 20000],
    'Peta dan Lokasi': [10000, 20000],
    'Analitik Pengguna': [10000, 20000],
    'Dokumentasi': [10000, 20000],
    'Manajemen Konten': [10000, 20000],
    'Pengaturan Aplikasi': [10000, 20000],
    'Bahasa dan Lokalisasi': [10000, 20000],
    'Feedback Pengguna': [10000, 20000],
    'FAQ dan Dukungan': [10000, 20000],
    'Pembayaran dan Transaksi': [10000, 20000],
    'Chat atau Obrolan': [10000, 20000],
    'Mode Gelap (Dark Mode)': [10000, 20000],
    'Rating dan Ulasan': [10000, 20000],
  };

  // Lama kerja
  int lamaKerja = 1;

  // Variabel untuk menyimpan data dari pengguna
  List<String> selectedKategori = [];
  List<String> selectedFitur = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentukan Harga Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Kategori aplikasi
              const Text('Kategori'),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: kategoriHarga.length,
                itemBuilder: (context, index) {
                  String kategori = kategoriHarga.keys.elementAt(index);
                  return CheckboxListTile(
                    title: Text(kategori),
                    value: selectedKategori.contains(kategori),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          selectedKategori.add(kategori);
                        } else {
                          selectedKategori.remove(kategori);
                        }
                      });
                    },
                  );
                },
              ),

              // Fitur aplikasi
              const Text('Fitur'),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fiturHarga.length,
                itemBuilder: (context, index) {
                  String fitur = fiturHarga.keys.elementAt(index);
                  return CheckboxListTile(
                    title: Text(fitur),
                    value: selectedFitur.contains(fitur),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          selectedFitur.add(fitur);
                        } else {
                          selectedFitur.remove(fitur);
                        }
                      });
                    },
                  );
                },
              ),

              // Lama kerja
              PopupMenuButton<int>(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('1 bulan'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('2 bulan'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('3 bulan'),
                  ),
                  const PopupMenuItem(
                    value: 4,
                    child: Text('4 bulan'),
                  ),
                ],
                onSelected: (value) {
                  setState(() {
                    lamaKerja = value;
                  });
                },
              ),

              // Tombol untuk menghitung harga
              TextButton(
                child: const Text('Hitung Harga'),
                onPressed: () {
                  // Hitung minimal dan maksimal harga
                  int minHarga = 0;
                  int maxHarga = 0;

                  for (String kategori in selectedKategori) {
                    int minPrice = kategoriHarga[kategori]![0] * (5 - lamaKerja);
                    int maxPrice = kategoriHarga[kategori]![1] * (5 - lamaKerja);
                    minHarga += minPrice;
                    maxHarga += maxPrice;
                  }

                  for (String fitur in selectedFitur) {
                    int minPrice = fiturHarga[fitur]![0] * (5 - lamaKerja);
                    int maxPrice = fiturHarga[fitur]![1] * (5 - lamaKerja);
                    minHarga += minPrice;
                    maxHarga += maxPrice;
                  }

                  // Tampilkan minimal dan maksimal harga
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                      content: Column(
                        children: [
                          Text(
                            'Minimal Harga: ${NumberFormat.currency(locale: 'id', decimalDigits: 0, name: 'Rp. ').format(minHarga)}',
                          ),
                          Text(
                            'Maksimal Harga: ${NumberFormat.currency(locale: 'id', decimalDigits: 0, name: 'Rp. ').format(maxHarga)}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

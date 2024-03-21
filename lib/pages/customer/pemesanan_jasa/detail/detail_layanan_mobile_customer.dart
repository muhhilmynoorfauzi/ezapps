import 'package:ezapps/model/layanan_mobile.dart';
import 'package:ezapps/pages/customer/pemesanan_jasa/verification/verification_mobile_customer.dart';
import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class DetailLayananMobileCustomer extends StatefulWidget {
  const DetailLayananMobileCustomer({super.key});

  @override
  State<DetailLayananMobileCustomer> createState() => _DetailLayananMobileCustomerState();
}

class _DetailLayananMobileCustomerState extends State<DetailLayananMobileCustomer> {
  /*
   1000000, 2500000
   500000, 1000000
   400000, 900000
   3000000, 6000000
   1000000, 5000000
   5000000, 7000000
   2500000, 5000000
   5000000, 7000000
  */

  // Kategori aplikasi
  final Map<String, List<int>> kategoriHarga = {
    'Pendidikan dan Pembelajaran': [100000, 100000],
    'Sistem Informasi': [100000, 100000],
    'Permainan dan Hiburan': [100000, 100000],
    'Sosial Media': [100000, 100000],
    'E-commerce': [100000, 100000],
    'Alat/Tools': [100000, 100000],
    'Kesehatan dan Kebugaran': [100000, 100000],
    'Travel dan Navigasi': [100000, 100000],
    'Produktivitas': [100000, 100000],
    'Fotografi dan Desain': [100000, 100000],
    'Keuangan dan Perbankan': [100000, 100000],
  };

  // Fitur aplikasi
  final Map<String, List<int>> fiturHarga = {
    'Autentikasi Pengguna': [100000, 500000],
    'Beranda (Home)': [100000, 500000],
    'Profil Pengguna': [100000, 500000],
    'Notifikasi': [100000, 500000],
    'Pencarian': [100000, 500000],
    'Integrasi Media Sosial': [100000, 500000],
    'Peta dan Lokasi': [100000, 500000],
    'Analitik Pengguna': [100000, 500000],
    'Dokumentasi': [100000, 500000],
    'Manajemen Konten': [100000, 500000],
    'Pengaturan Aplikasi': [100000, 500000],
    'Bahasa dan Lokalisasi': [100000, 500000],
    'Feedback Pengguna': [100000, 500000],
    'FAQ dan Dukungan': [100000, 500000],
    'Pembayaran dan Transaksi': [100000, 500000],
    'Chat atau Obrolan': [100000, 500000],
    'Mode Gelap (Dark Mode)': [100000, 500000],
    'Rating dan Ulasan': [100000, 500000],
  };
  var indexWaktu = 0;

  // Lama kerja
  int lamaKerja = 1;

  // Variabel untuk menyimpan text dari nama dan deskripsi
  TextEditingController nameAppController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  // Variabel untuk menyimpan data dari pengguna
  List<String> selectedKategori = [];
  List<String> selectedFitur = [];

  // Hitung minimal dan maksimal harga
  late int minHarga;
  late int maxHarga;

  @override
  void initState() {
    // TODO: implement initState
    nameAppController = TextEditingController();
    deskripsiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameAppController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget waktu(int index, String title, int lamaKerja) {
      return Expanded(
        child: InkWell(
          onTap: () => setState(() {
            indexWaktu = index;
            this.lamaKerja = lamaKerja;
          }),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: (indexWaktu == index) ? null : Border.all(color: primary),
              gradient: (indexWaktu == index)
                  ? LinearGradient(colors: [primary, secondary], begin: Alignment.topLeft, end: Alignment.bottomRight)
                  : null,
            ),
            child: Center(child: Text(title, style: TextStyle(color: (indexWaktu == index) ? Colors.white : primary))),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        toolbarHeight: 60,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.navigate_before_rounded, size: 30, color: Colors.white),
        ),
        centerTitle: true,
        title: const Text('Mobile Application', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: primary,
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [primary, secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                onChanged: (text) => nameAppController.text = text,
                controller: nameAppController,
                decoration: InputDecoration(
                  label: const Text('Apa nama aplikasi yang anda ingin buat?'),
                  hintText: 'Misal: Tokoku (Bisa diganti nanti)',
                  hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Warna border saat di klik
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
            ),
            StickyHeader(
              header: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Apa kategori Aplikasi yang ingin anda buat?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              content: Column(
                children: List.generate(
                  kategoriHarga.length,
                  (index) {
                    String kategori = kategoriHarga.keys.elementAt(index);
                    return CheckboxListTile(
                      activeColor: secondary,
                      title: Text(kategori, style: const TextStyle(fontSize: 13)),
                      value: selectedKategori.contains(kategori),
                      onChanged: (value) => setState(() {
                        if (value!) {
                          selectedKategori.add(kategori);
                        } else {
                          selectedKategori.remove(kategori);
                        }
                      }),
                    );
                  },
                ),
              ),
            ), //
            StickyHeader(
              header: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Apa fitur Aplikasi yang ingin anda buat?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              content: Column(
                children: List.generate(
                  fiturHarga.length,
                  (index) {
                    String fitur = fiturHarga.keys.elementAt(index);
                    return CheckboxListTile(
                      activeColor: secondary,
                      title: Text(fitur, style: const TextStyle(fontSize: 13)),
                      value: selectedFitur.contains(fitur),
                      onChanged: (value) => setState(() {
                        if (value!) {
                          selectedFitur.add(fitur);
                        } else {
                          selectedFitur.remove(fitur);
                        }
                      }),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Estimasi Waktu',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      waktu(0, '1 Bulan', 1),
                      const SizedBox(width: 10),
                      waktu(1, '2 Bulan', 2),
                      const SizedBox(width: 10),
                      waktu(2, '3 Bulan', 3),
                      const SizedBox(width: 10),
                      waktu(3, '4 Bulan', 4),
                      const SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              // color: Colors.red,
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                onChanged: (text) => deskripsiController.text = text,
                controller: deskripsiController,
                maxLines: null,
                // scrollPadding: EdgeInsets.all(20),
                decoration: InputDecoration(
                  label: const Text('Berikan deskripsi lengkap'),
                  hintText:
                      'Misal: Aplikasi X adalah solusi belanja online yang efisien dan personal. Dengan antarmuka ramah pengguna, pelanggan dapat dengan mudah menjelajahi produk, mendapatkan rekomendasi, dan melakukan pembelian cepat. Fitur-fitur inklusif meliputi pelacakan pengiriman real-time, notifikasi penawaran eksklusif, dan integrasi pembayaran yang aman. Aplikasi ini dirancang untuk memaksimalkan kenyamanan pengguna dalam belanja online.',
                  hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Warna border saat di klik
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: [primary, secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: OutlinedButton(
            onPressed: () {
              if (nameAppController.text.isEmpty ||
                  deskripsiController.text.isEmpty ||
                  selectedKategori.isEmpty ||
                  selectedFitur.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    ),
                    closeIconColor: Colors.red,
                    backgroundColor: Colors.red,
                    content: Center(child: Text('Lengkapi Form', style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                );
              } else {
                // Hitung minimal dan maksimal harga
                int min = 0;
                int max = 0;

                for (String kategori in selectedKategori) {
                  int minPrice = kategoriHarga[kategori]![0] * (5 - lamaKerja);
                  int maxPrice = kategoriHarga[kategori]![1] * (5 - lamaKerja);
                  min += minPrice;
                  max += maxPrice;
                }

                for (String fitur in selectedFitur) {
                  int minPrice = fiturHarga[fitur]![0] * (5 - lamaKerja);
                  int maxPrice = fiturHarga[fitur]![1] * (5 - lamaKerja);
                  min += minPrice;
                  max += maxPrice;
                }

                minHarga = min;
                maxHarga = max;

                Navigator.push(
                  context,
                  SlideTransition1(
                    VerificationMobileCustomer(
                      mobileService: LayananMobile(
                        nameApp: nameAppController.text,
                        kategori: selectedKategori,
                        fitur: selectedFitur,
                        voucher: 'voucher',
                        lamaKerja: lamaKerja,
                        mulaikerja: null,
                        selesaikerja: null,
                        tglPengajuan: DateTime.now(),
                        minPrice: minHarga,
                        maxPrice: maxHarga,
                        deskripsi: deskripsiController.text,
                        konfirmasi: true,
                        meeting: false,
                        dp: false,
                        repayment: false,
                        development: false,
                        finish: false,
                        cancel: false,
                        timeKonfirmasi: DateTime.now(),
                        timeMeeting: null,
                        timeDp: null,
                        timeRepayment: null,
                        timeDevelopment: null,
                        timeFinish: null,
                        timeCancel: null,
                      ),
                    ),
                  ),
                );
              }
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              ),
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            ),
            child:
                const Text('Lihat Estimasi Harga', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  void kategoriHandle(String option, bool? value) {
    setState(() {
      if (value != null && value) {
        selectedKategori.add(option);
      } else {
        selectedKategori.remove(option);
      }
    });
  }

  void fiturHandle(String option, bool? value) {
    setState(() {
      if (value != null && value) {
        selectedFitur.add(option);
      } else {
        selectedFitur.remove(option);
      }
    });
  }
}

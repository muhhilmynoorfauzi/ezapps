import 'dart:ui';

import 'package:ezapps/pages/customer/pemesanan_jasa/detail/detail_layanan_desain_customer.dart';
import 'package:ezapps/pages/customer/pemesanan_jasa/detail/detail_layanan_ml_customer.dart';
import 'package:ezapps/pages/customer/pemesanan_jasa/detail/detail_layanan_mobile_customer.dart';
import 'package:ezapps/pages/customer/pemesanan_jasa/detail/detail_layanan_uiux_customer.dart';
import 'package:ezapps/pages/customer/pemesanan_jasa/detail/detail_layanan_web_customer.dart';
import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';

class LayananCustomer extends StatefulWidget {
  const LayananCustomer({super.key});

  @override
  State<LayananCustomer> createState() => _LayananCustomerState();
}

class _LayananCustomerState extends State<LayananCustomer> {
  Widget jobdesk(String job, String deskJob, dynamic page, String image) {
    var borderOnlyRight = const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10));
    return SizedBox(
      width: lebar(context) * .95,
      child: OutlinedButton(
        onPressed: () => Navigator.push(context, SlideTransition1(page)),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          side: MaterialStateProperty.all<BorderSide>(BorderSide(color: primary)),
          backgroundColor: MaterialStateProperty.all<Color>(primary.withOpacity(.8)),
        ),
        child: Row(
          children: [
            Image.asset(image, fit: BoxFit.cover, width: 100, height: 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: borderOnlyRight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(
                      deskJob,
                      style:
                          TextStyle(color: Colors.black.withOpacity(.5), fontSize: 12, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // toolbarHeight: 60,
        backgroundColor: Colors.white.withOpacity(0),
        title: const Text('Pemesanan', style: TextStyle(color: Colors.black)),
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: Colors.white.withOpacity(.5)),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: (AppBar().preferredSize.height + MediaQuery.of(context).padding.top)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: lebar(context)), //pasak
              jobdesk(
                'Mobile Application',
                'Aplikasi seluler adalah perangkat lunak untuk smartphone/tablet, diunduh dari toko aplikasi. Tujuannya bervariasi: produktivitas, sosial media, e-commerce, game, kesehatan, dan pendidikan. Mereka mempermudah pengguna menjalankan berbagai tugas melalui perangkat seluler.',
                const DetailLayananMobileCustomer(),
                'assets/mobile.png',
              ),
              const SizedBox(height: 10),
              jobdesk(
                'Website Application',
                'Aplikasi web adalah perangkat lunak diakses melalui browser tanpa instalasi. Gunakan HTML, CSS, dan JavaScript, bisa diakses dari berbagai perangkat, memungkinkan interaksi pengguna dinamis. Contohnya: Gmail, Facebook, Google Docs.',
                DetailLayananWebCustomer(),
                'assets/web.png',
              ),
              const SizedBox(height: 10),
              jobdesk(
                'UI/UX',
                'UI (User Interface) adalah tentang desain antarmuka pengguna, termasuk elemen visual seperti tombol dan warna. UX (User Experience) mencakup keseluruhan pengalaman pengguna, fokus pada kepuasan, navigasi, dan responsivitas produk. Keduanya penting untuk menciptakan produk digital yang sukses.',
                DetailLayananUIUXCustomer(),
                'assets/uiux.png',
              ),
              const SizedBox(height: 10),
              jobdesk(
                'Design (logo/ppt/dll)',
                'Desain grafis menciptakan visual dengan gambar, teks, dan warna untuk komunikasi pesan. Melibatkan komunikasi visual, tipografi, dan penggunaan warna. Gunakan perangkat lunak seperti Adobe Photoshop atau Illustrator, dan terapkan prinsip desain responsif untuk berbagai perangkat.',
                DetailLayananDesainCustomer(),
                'assets/desain.png',
              ),
              const SizedBox(height: 10),
              jobdesk(
                'Machine Learning',
                'Machine learning (ML) adalah cabang kecerdasan buatan di mana komputer belajar dari data tanpa instruksi langsung. Tiga jenis utama: supervised learning (dengan label), unsupervised learning (tanpa label), dan reinforcement learning (melalui tindakan). Digunakan dalam berbagai aplikasi seperti pengenalan wajah, rekomendasi, dan pemrosesan bahasa alami.',
                DetailLayananMLCustomer(),
                'assets/ml.png',
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ezapps/model/layanan_mobile.dart';
import 'package:ezapps/pages/customer/pemesanan_jasa/result/result_costumer.dart';
import 'package:ezapps/providers/firestore_service.dart';
import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:ezapps/service/state_manajement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class VerificationMobileCustomer extends StatefulWidget {
  LayananMobile mobileService;

  VerificationMobileCustomer({required this.mobileService});

  @override
  State<VerificationMobileCustomer> createState() {
    // ignore: no_logic_in_create_state
    return _VerificationMobileCustomerState(mobileService);
  }
}

class _VerificationMobileCustomerState extends State<VerificationMobileCustomer> {
  LayananMobile mobileService;

  _VerificationMobileCustomerState(this.mobileService);

  Future dialogKonfirmasi(BuildContext context) => showDialog(
        context: context,
        builder: (c) => AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          icon: Icon(Icons.hourglass_bottom_rounded, size: 50, color: primary),
          // iconColor: primary,
          title: const Text('Konfirmasi Permintaan'),
          titleTextStyle: TextStyle(color: primary, fontWeight: FontWeight.bold, fontSize: 20),
          actionsPadding: const EdgeInsets.all(20),
          actions: [
            Container(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  backgroundColor: MaterialStateColor.resolveWith((states) => primary),
                ),
                onPressed: () async {
                  Navigator.of(context).pop(false);
                  context.read<Counter>().setLoading(true);
                  await Future.delayed(
                    const Duration(seconds: 1),
                    () => FirestoreService.addInventory(mobileService),
                  );
                  // ignore: use_build_context_synchronously
                  context.read<Counter>().setLoading(false);
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(context, SizeTransition1(const ResultCostumer()), (route) => route.isFirst);
                },
                child: const Text('Ajukan Sekarang', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0),
            toolbarHeight: 60,
            scrolledUnderElevation: 0,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.navigate_before_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: const Text('Verification', style: TextStyle(color: Colors.white)),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
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
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Kisaran harga', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primary.withOpacity(.2),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Minimal Harga', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          Text('Maksimal Harga', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  NumberFormat.currency(locale: 'id', decimalDigits: 0, name: 'Rp. ').format(mobileService.minPrice),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.remove),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  NumberFormat.currency(locale: 'id', decimalDigits: 0, name: 'Rp. ').format(mobileService.maxPrice),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 5,
                  width: double.infinity,
                  color: Colors.black.withOpacity(.05),
                ),
                //
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primary.withOpacity(.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nama Aplikasi', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(mobileService.nameApp, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                //
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Kategori aplikasi', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary.withOpacity(.2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      mobileService.kategori.length,
                      (index) => Text('•	${mobileService.kategori[index]}', style: const TextStyle(fontSize: 13)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Fitur aplikasi', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primary.withOpacity(.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      mobileService.fitur.length,
                      (index) => Text('•	${mobileService.fitur[index]}', style: const TextStyle(fontSize: 13)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Deskripsi lengkap', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary.withOpacity(.2)),
                  child: Text(mobileService.deskripsi, style: const TextStyle(fontSize: 13)),
                ),
                Container(height: 5, width: double.infinity, color: Colors.black.withOpacity(.05)),
                //
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary.withOpacity(.2)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Voucher', style: TextStyle(fontSize: 13)),
                      Text('-', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                //
                Container(
                  height: 5,
                  width: double.infinity,
                  color: Colors.black.withOpacity(.05),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Note:', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primary.withOpacity(.2),
                  ),
                  child: const Text(
                    'Permintaan pembuatan aplikasi yang diajukan akan direview kembali, dan tim EZPROG akan menyusun jadwal pertemuan secara online sebagai langkah awal dalam proses pembuatan aplikasi Anda.',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.justify,
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
                onPressed: () async => await dialogKonfirmasi(context),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                ),
                child: const Text(
                  'Ajukan Permintaan',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        (context.watch<Counter>().loading)
            ? Container(
                height: tinggi(context),
                width: lebar(context),
                color: Colors.black.withOpacity(.5),
                child: Center(child: CircularProgressIndicator(color: primary)),
              )
            : Container(),
      ],
    );
  }
}

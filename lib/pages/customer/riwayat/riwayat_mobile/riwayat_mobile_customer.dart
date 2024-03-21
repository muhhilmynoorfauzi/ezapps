import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezapps/model/layanan_mobile.dart';
import 'package:ezapps/pages/customer/riwayat/riwayat_mobile/detail_riwayat_mobile_customer.dart';
import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';

class RiwayatMobileCustomer extends StatefulWidget {
  @override
  State<RiwayatMobileCustomer> createState() => _RiwayatMobileCustomerState();
}

class _RiwayatMobileCustomerState extends State<RiwayatMobileCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        toolbarHeight: 60,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.navigate_before_rounded, size: 30),
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text('Mobile App History', style: TextStyle(color: Colors.white)),
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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("layananMobile").orderBy("tglPengajuan", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var layananMobile = snapshot.data!.docs.map((mobile) => LayananMobile.fromSnapshot(mobile)).toList();

            return (layananMobile.isEmpty)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.playlist_remove_rounded, size: 150, color: primary),
                        Text(
                          'Belum ada riwayat pemesanan',
                          style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: layananMobile.length,
                    itemBuilder: (context, index) {
                      // var id = snapshot.data!.docs[index].id;
                      String status = layananMobile[index].cancel
                          ? 'Batal'
                          : layananMobile[index].finish
                              ? 'Selesai'
                              : layananMobile[index].repayment
                                  ? 'Pelunasan'
                                  : layananMobile[index].development
                                      ? 'Sedang dikerjakan'
                                      : layananMobile[index].dp
                                          ? 'Pembayaran Awal'
                                          : layananMobile[index].meeting
                                              ? 'Meeting'
                                              : layananMobile[index].konfirmasi
                                                  ? 'Menunggu Konfirmasi'
                                                  : '';
                      return Card(
                        color: Colors.white,
                        elevation: .5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlideTransition1(DetailRiwayatMobileCustomer(mobileService: layananMobile[index])),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        layananMobile[index].nameApp,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        layananMobile[index].deskripsi,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // color: Colors.blue,
                                  // height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'tanggal pemesanan:\n'
                                        '${layananMobile[index].tglPengajuan?.month}-'
                                        '${layananMobile[index].tglPengajuan?.month}-'
                                        '${layananMobile[index].tglPengajuan?.year} '
                                        '${layananMobile[index].tglPengajuan?.timeZoneName}',
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: (layananMobile[index].cancel)
                                              ? Colors.red
                                              : (layananMobile[index].finish)
                                                  ? Colors.green
                                                  : Colors.orangeAccent,
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        child: Text(
                                          status,
                                          style: const TextStyle(fontSize: 12, color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

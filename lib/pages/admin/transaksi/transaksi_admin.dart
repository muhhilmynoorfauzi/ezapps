import 'dart:ui';

import 'package:ezapps/pages/admin/transaksi/transaksi_mobile/riwayat_mobile_admin.dart';
import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';

class TransaksiAdmin extends StatefulWidget {
  const TransaksiAdmin({super.key});

  @override
  State<TransaksiAdmin> createState() => _TransaksiAdminState();
}

class _TransaksiAdminState extends State<TransaksiAdmin> {
  @override
  Widget build(BuildContext context) {
    //------------------------------------------------------------------------------------------------------------------
    Widget Transaksi(String title, String image, dynamic page) => OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
          ),
          onPressed: () => Navigator.push(context, SlideTransition1(page)),
          child: Container(
            margin: const EdgeInsets.all(10),
            width: lebar(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primary),
                        ),
                        Image.asset(image, height: 50, width: 50),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Text(title, style: const TextStyle(color: Colors.black)),
                  ],
                ),
                const Icon(Icons.navigate_next_rounded, color: Colors.black),
              ],
            ),
          ),
        );
    //------------------------------------------------------------------------------------------------------------------

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // toolbarHeight: 60,
        backgroundColor: Colors.white.withOpacity(0),
        title: const Text('Transaksi', style: TextStyle(color: Colors.black)),
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
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
      body: Container(
        height: tinggi(context),
        width: lebar(context),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: (AppBar().preferredSize.height + MediaQuery.of(context).padding.top) + 5),
              Transaksi('Mobile App History', 'assets/mobile.png', TransaksiMobileAdmin()),
              Transaksi('Web App History', 'assets/web.png', TransaksiMobileAdmin()),
              Transaksi('UI/UX History', 'assets/uiux.png', TransaksiMobileAdmin()),
              Transaksi('Desain History', 'assets/desain.png', TransaksiMobileAdmin()),
              Transaksi('Machine Learning History', 'assets/ml.png', TransaksiMobileAdmin()),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

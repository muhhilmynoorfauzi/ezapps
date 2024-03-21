import 'dart:ui';

import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';

import 'riwayat_mobile/riwayat_mobile_customer.dart';

class RiwayatCustomer extends StatefulWidget {
  const RiwayatCustomer({super.key});

  @override
  State<RiwayatCustomer> createState() => _RiwayatCustomerState();
}

class _RiwayatCustomerState extends State<RiwayatCustomer> {
  @override
  Widget build(BuildContext context) {
    //------------------------------------------------------------------------------------------------------------------
    Widget riwayat(String title, String image, dynamic page) => OutlinedButton(
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
        title: const Text('Riwayat', style: TextStyle(color: Colors.black)),
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
      body: Container(
        height: tinggi(context),
        width: lebar(context),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: (AppBar().preferredSize.height + MediaQuery.of(context).padding.top) + 5),
              riwayat('Mobile App History', 'assets/mobile.png', RiwayatMobileCustomer()),
              riwayat('Web App History', 'assets/web.png', RiwayatMobileCustomer()),
              riwayat('UI/UX History', 'assets/uiux.png', RiwayatMobileCustomer()),
              riwayat('Desain History', 'assets/desain.png', RiwayatMobileCustomer()),
              riwayat('Machine Learning History', 'assets/ml.png', RiwayatMobileCustomer()),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

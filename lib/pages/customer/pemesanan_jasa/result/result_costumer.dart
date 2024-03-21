import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/state_manajement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultCostumer extends StatefulWidget {
  const ResultCostumer({super.key});

  @override
  State<ResultCostumer> createState() => _ResultCostumerState();
}

class _ResultCostumerState extends State<ResultCostumer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(100)),
              child: Image.asset('assets/mobile.png', height: 200, width: 200),
            ),
            SizedBox(height: 20),
            Text('Pengajuan Berhasil', style: TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('sedang mengunggu konfirmasi', style: TextStyle(color: Colors.black)),
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
            onPressed: () async {
              context.read<Counter>().goTo(index: 3);
              Navigator.pop(context);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              ),
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            ),
            child: const Text(
              'Lihat di riwayat Pengajuan',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:ezapps/pages/admin/home/home_admin.dart';
import 'package:ezapps/pages/admin/transaksi/transaksi_admin.dart';
import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/state_manajement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavbarAdmin extends StatefulWidget {
  const NavbarAdmin({super.key});

  @override
  State<NavbarAdmin> createState() => _NavbarAdminState();
}

class _NavbarAdminState extends State<NavbarAdmin> {
  @override
  Widget build(BuildContext context) {
    var pageIndex = context.watch<Counter>().pageIndex;
    final screen = [const HomeAdmin(), const TransaksiAdmin()];
    return Scaffold(
      body: screen[pageIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        height: 45,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [primary, secondary], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                  ),
                  onPressed: () => context.read<Counter>().goTo(index: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/home.svg',
                        height: 20,
                        color: Colors.white.withOpacity((pageIndex == 0) ? 1 : .5),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white.withOpacity((pageIndex == 0) ? 1 : .5),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                  ),
                  onPressed: () => context.read<Counter>().goTo(index: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/riwayat.svg',
                        height: 20,
                        color: Colors.white.withOpacity((pageIndex == 1) ? 1 : .5),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Riwayat',
                        style: TextStyle(
                          color: Colors.white.withOpacity((pageIndex == 1) ? 1 : .5),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

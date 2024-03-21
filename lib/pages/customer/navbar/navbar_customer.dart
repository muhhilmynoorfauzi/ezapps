import 'package:ezapps/pages/customer/Riwayat/riwayat_customer.dart';
import 'package:ezapps/pages/customer/home/home_costomer.dart';
import 'package:ezapps/pages/customer/pemesanan_jasa/layanan_customer.dart';
import 'package:ezapps/pages/customer/profile/profile_customer.dart';
import 'package:ezapps/pages/customer/voucher/voucher_customer.dart';
import 'package:ezapps/service/state_manajement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavbarCustomer extends StatefulWidget {
  const NavbarCustomer({super.key});

  @override
  State<NavbarCustomer> createState() => _NavbarCustomerState();
}

class _NavbarCustomerState extends State<NavbarCustomer> {
  @override
  Widget build(BuildContext context) {
    var pageIndex = context.watch<Counter>().pageIndex;
    final screen = [
      const HomeCustomer(),
      const VoucherCustomer(),
      const LayananCustomer(),
      const RiwayatCustomer(),
      const ProfileCustomer(),
    ];
    return Scaffold(
      body: screen[pageIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80,
        child: Stack(
          children: [
            SvgPicture.asset(
              height: 80,
              'assets/navbar.svg',
              fit: BoxFit.fitHeight,
            ),
            Column(
              children: [
                Expanded(child: Container()),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 47.32,
                        // color: Colors.red,
                        child: InkWell(
                          onTap: () => context.read<Counter>().goTo(index: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                height: 20,
                                'assets/home.svg',
                                color: Colors.white.withOpacity((pageIndex == 0) ? 1 : .5),
                              ),
                              Text(
                                'Home',
                                style:
                                    TextStyle(color: Colors.white.withOpacity((pageIndex == 0) ? 1 : .5), fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 47.32,
                        // color: Colors.red,
                        child: InkWell(
                          onTap: () => context.read<Counter>().goTo(index: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                height: 18,
                                'assets/voucher.svg',
                                color: Colors.white.withOpacity((pageIndex == 1) ? 1 : .5),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Voucher',
                                style: TextStyle(
                                  color: Colors.white.withOpacity((pageIndex == 1) ? 1 : .5),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container(height: 47.32)),
                    Expanded(
                      child: Container(
                        height: 47.32,
                        // color: Colors.red,
                        child: InkWell(
                          onTap: () => context.read<Counter>().goTo(index: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                height: 20,
                                'assets/riwayat.svg',
                                color: Colors.white.withOpacity((pageIndex == 3) ? 1 : .5),
                              ),
                              Text(
                                'Riwayat',
                                style:
                                    TextStyle(color: Colors.white.withOpacity((pageIndex == 3) ? 1 : .5), fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 47.32,
                        // color: Colors.red,
                        child: InkWell(
                          onTap: () => context.read<Counter>().goTo(index: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                height: 20,
                                'assets/profile.svg',
                                color: Colors.white.withOpacity((pageIndex == 4) ? 1 : .5),
                              ),
                              Text(
                                'Profile',
                                style:
                                    TextStyle(color: Colors.white.withOpacity((pageIndex == 4) ? 1 : .5), fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 63.1,
                  width: 63.1,
                  // color: Colors.red,
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () => context.read<Counter>().goTo(index: 2),
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      color: Colors.white.withOpacity((pageIndex == 2) ? 1 : .5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

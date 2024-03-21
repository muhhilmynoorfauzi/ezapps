import 'package:ezapps/config/config.dart';
import 'package:ezapps/config/flavor_type.dart';
import 'package:ezapps/pages/admin/navbar/navbar_admin.dart';
import 'package:ezapps/pages/customer/navbar/navbar_customer.dart';
import 'package:flutter/material.dart';

late final AppConfig configPlatform;

Future<Widget> initializeApp(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  configPlatform = config;

  return const EZApp();
}

class EZApp extends StatelessWidget {
  const EZApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZProg',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(highlightColor: Colors.transparent, splashColor: Colors.transparent),
      home: (configPlatform.flavor == FlavorType.customer) ? const NavbarCustomer() : const NavbarAdmin(),
    );
  }
}

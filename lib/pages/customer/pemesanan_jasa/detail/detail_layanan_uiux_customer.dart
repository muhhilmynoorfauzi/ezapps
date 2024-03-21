import 'package:ezapps/service/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailLayananUIUXCustomer extends StatefulWidget {
  @override
  State<DetailLayananUIUXCustomer> createState() => _DetailLayananUIUXCustomerState();
}

class _DetailLayananUIUXCustomerState extends State<DetailLayananUIUXCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        toolbarHeight: 60,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.navigate_before_rounded,
              size: 30,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text('UI/UX', style: TextStyle(color: Colors.white)),
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
    );
  }
}

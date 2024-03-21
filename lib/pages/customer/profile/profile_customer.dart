import 'dart:ui';

import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';

class ProfileCustomer extends StatefulWidget {
  const ProfileCustomer({super.key});

  @override
  State<ProfileCustomer> createState() => _ProfileCustomerState();
}

class _ProfileCustomerState extends State<ProfileCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // toolbarHeight: 60,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        elevation: 0,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: (AppBar().preferredSize.height + MediaQuery.of(context).padding.top) + 5),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              Card(
                elevation: 0,
                child: Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.all(50),
                  width: lebar(context),
                  child: Text('data'),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

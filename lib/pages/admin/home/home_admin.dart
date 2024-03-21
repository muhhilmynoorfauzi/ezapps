import 'dart:ui';

import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    BorderRadius borderOnlyButtom =
        const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white.withOpacity(.0),
            elevation: 0,
            scrolledUnderElevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              background: ClipRRect(
                borderRadius: borderOnlyButtom,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Card(
                    color: Colors.white.withOpacity(.6),
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(borderRadius: borderOnlyButtom),
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: lebar(context),
                          height: 50,
                          child: Center(child: SvgPicture.asset('assets/logo_admin.svg', height: 34)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 200,
                        width: lebar(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primary.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

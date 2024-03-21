import 'dart:ui';

import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCustomer extends StatefulWidget {
  const HomeCustomer({super.key});

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  var kIcons = [
    'assets/bg1.png',
    'assets/bg1.png',
    'assets/bg1.png',
    'assets/bg1.png',
    'assets/bg1.png',
    'assets/bg1.png',
  ];

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
                          child: Center(child: SvgPicture.asset('assets/logo2.svg', height: 34)),
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
                var borderOnlyTop =
                    const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20));

                Widget imageSlider = ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {},
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: DefaultTabController(
                        length: kIcons.length,
                        child: Builder(
                          builder: (BuildContext context) => Stack(
                            children: <Widget>[
                              TabBarView(
                                children: List.generate(
                                  kIcons.length,
                                  (index) => Image.asset(kIcons[index], fit: BoxFit.cover),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: lebar(context)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TabPageSelector(
                                      selectedColor: primary,
                                      indicatorSize: 7,
                                      borderStyle: BorderStyle.none,
                                      color: Colors.black.withAlpha(40),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
                return Container(
                  decoration: BoxDecoration(borderRadius: borderOnlyTop, color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.all(10), child: imageSlider),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 40,
                        width: 200,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary.withOpacity(.5)),
                      ),
                      Container(
                        height: 200,
                        width: lebar(context),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 10),
                          children: List.generate(
                            10,
                            (index) => Container(
                              width: 150,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), color: primary.withOpacity(.5)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                          10,
                          (index) => Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 200,
                            width: lebar(context),
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary.withOpacity(.5)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
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

// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/button_material.dart/button_bar.dart';
import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:homepage/material_custom.dart/gridview_image.dart';
import 'package:homepage/material_custom.dart/mini_box_custom.dart';
import 'package:homepage/material_custom.dart/row1_custom.dart';
import 'package:homepage/test_pinned.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showWidget = false;
  int numberOfPages = 15;
  int currentPage = 0;
  late ScrollController _scrollController;
  bool _isPinned = false;

  @override
  double rating = 4;
  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfPages,
        (index) => Center(
              child: Text(
                "Page Number:${index + 1}",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ));
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: CustomAppBar(),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.center,
                      colors: [
                        Color(0XFF1E1E1E),
                        Color.fromARGB(255, 33, 31, 31),
                      ]),
                ),
              ),
              toolbarHeight: 100,
              pinned: true,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 190, top: 30),
                      child: CircleAvatar(
                        backgroundColor: Color(0XFF777777),
                        radius: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/avt1.png"),
                          radius: 48,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 300,
                      top: 40,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Lathersalonaspen",
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700))),
                        WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(
                            text: "Open Now ",
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Color(0XFF007B2A),
                                    fontWeight: FontWeight.w700))),
                        TextSpan(
                            text: "- Closes 10 PM",
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Color(0XFF777777),
                                    fontWeight: FontWeight.w700))),
                      ])),
                    ),
                    Positioned(
                      left: 300,
                      top: 100,
                      child: Text.rich(TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                                size: 25, color: Colors.amber, Icons.star)),
                        TextSpan(
                            text: "4.5",
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600))),
                        TextSpan(
                            text: " (1200)",
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0XFF777777)))),
                        WidgetSpan(child: SizedBox(width: 10)),
                        WidgetSpan(
                            child: Image(
                                width: 22,
                                height: 22,
                                image: AssetImage("images/tichxanh.png"))),
                        WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(
                            text: "Verified by Owner",
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFF777777)))),
                      ])),
                    ),
                    Positioned(right: 150, top: 100, child: CustomButtonBar()),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/banner2.png")),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10))),
                              width: 260,
                              height: 230,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/banner2.png")),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10))),
                              width: 260,
                              height: 230,
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/banner2.png")),
                              ),
                              width: 260,
                              height: 230,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/banner2.png")),
                              ),
                              width: 260,
                              height: 230,
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 410,
                      height: 470,
                      child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("images/banner1.png")),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/banner2.png")),
                                color: Colors.amber,
                              ),
                              width: 260,
                              height: 230,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/banner2.png")),
                                color: Colors.amber,
                              ),
                              width: 260,
                              height: 230,
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/banner2.png")),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10))),
                              width: 260,
                              height: 230,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("images/banner2.png")),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10))),
                              width: 260,
                              height: 230,
                            ),
                          ]),
                    ),
                  ],
                ),
                Positioned(
                  right: 200,
                  bottom: 20,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Show all Photos'),
                                        SizedBox(
                                          width: 400,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(1),
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                      Size(130, 50)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  side: BorderSide(
                                                      width: 3,
                                                      color: Color(0XFFCDCDCD)),
                                                ),
                                              ),
                                            ),
                                            child: Text.rich(
                                              TextSpan(children: [
                                                WidgetSpan(
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                    child: Icon(
                                                        color: Color.fromARGB(
                                                            212, 14, 14, 11),
                                                        size: 25,
                                                        Icons.share_outlined)),
                                                WidgetSpan(
                                                    child: SizedBox(width: 5)),
                                                TextSpan(
                                                    text: "Share",
                                                    style: GoogleFonts.mulish(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0XFF777777),
                                                            fontSize: 20))),
                                              ]),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(1),
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                      Size(130, 50)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  side: BorderSide(
                                                      width: 3,
                                                      color: Color(0XFFCDCDCD)),
                                                ),
                                              ),
                                            ),
                                            child: Text.rich(
                                              TextSpan(children: [
                                                WidgetSpan(
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                    child: Icon(
                                                        color: Color.fromARGB(
                                                            212, 14, 14, 11),
                                                        size: 25,
                                                        Icons.favorite_border)),
                                                WidgetSpan(
                                                    child: SizedBox(width: 5)),
                                                TextSpan(
                                                    text: "Save",
                                                    style: GoogleFonts.mulish(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0XFF777777),
                                                            fontSize: 20))),
                                              ]),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(1),
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                      Size(170, 50)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  side: BorderSide(
                                                      width: 3,
                                                      color: Color(0XFFCDCDCD)),
                                                ),
                                              ),
                                            ),
                                            child: Text.rich(
                                              TextSpan(children: [
                                                TextSpan(
                                                    text: "Sort by: ",
                                                    style: GoogleFonts.mulish(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0XFF777777),
                                                            fontSize: 20))),
                                                TextSpan(
                                                    text: "All",
                                                    style: GoogleFonts.mulish(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            fontSize: 20))),
                                                WidgetSpan(
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                    child: Icon(
                                                        color: Color.fromARGB(
                                                            212, 14, 14, 11),
                                                        size: 35,
                                                        Icons.arrow_drop_down)),
                                              ]),
                                            )),
                                        SizedBox(
                                          width: 500,
                                        ),
                                        IconButton(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                content: Container(
                                    width: 1500,
                                    height: 1000,
                                    child: GridViewImage()),
                              );
                            });
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        fixedSize: MaterialStateProperty.all(Size(190, 50)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side:
                                BorderSide(width: 3, color: Color(0XFFCDCDCD)),
                          ),
                        ),
                      ),
                      child: Text.rich(
                        TextSpan(children: [
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                  color: Color.fromARGB(212, 14, 14, 11),
                                  size: 20,
                                  Icons.grid_3x3_outlined)),
                          WidgetSpan(child: SizedBox(width: 5)),
                          TextSpan(
                              text: "Show all Photos",
                              style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF777777),
                                      fontSize: 20))),
                        ]),
                      )),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 50,
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}

class _CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 100,
      color: Colors.blue,
      child: Center(
        child: Text('SliverPersistentHeader in Positioned'),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(_CustomHeaderDelegate oldDelegate) {
    return false;
  }
}

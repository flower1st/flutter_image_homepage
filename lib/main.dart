// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:homepage/material_custom.dart/gridview_image.dart';
import 'package:homepage/test_pinned.dart';
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
  late ScrollController _scrollController;
  bool _isContainerVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _isContainerVisible = true;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isContainerVisible = false;
      });
    }
  }

  double rating = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            title: CustomAppBar(),
            toolbarHeight: 100,
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
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
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
                                fontSize: 30, fontWeight: FontWeight.w700))),
                  ])),
                ),
                Positioned(
                  left: 300,
                  top: 80,
                  child: Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child: Icon(size: 25, color: Colors.amber, Icons.star)),
                    TextSpan(
                        text: "4.6",
                        style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600))),
                    TextSpan(
                        text: " (1200)",
                        style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Color(0XFF777777)))),
                    WidgetSpan(
                        child: Image(
                            width: 22,
                            height: 22,
                            image: AssetImage("images/tichxanh.png")))
                  ])),
                )
              ],
            ),
          ),
        ],
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class _PinnedItemDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromARGB(
          255, 241, 240, 240), // Set the background color of the pinned item
      child: Center(
        child: Text(
          'Pinned Item',
          style: TextStyle(fontSize: 200, color: Colors.white),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 150; // Set the maximum height of the pinned item

  @override
  double get minExtent => 150; // Set the minimum height of the pinned item

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

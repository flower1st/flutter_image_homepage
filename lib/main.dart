// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, override_on_non_overriding_member, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/bottom_material/bottom_links.dart';
import 'package:homepage/button_material.dart/button_bar.dart';
import 'package:homepage/button_material.dart/button_image.dart';
import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:homepage/material_custom.dart/mouse_region.dart';
import 'material_custom.dart/google_map_api2.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;
  late AnimationController _controller;
  late ScrollController _scrollController;
  late Timer _pinTimer;
  @override
  void dispose() {
    _pinTimer?.cancel();
    super.dispose();
  }

  Duration _pinDelayDuration = Duration(milliseconds: 500);
  ScrollController _scrollController2 = ScrollController();
  bool isButtonVisible = true;
  bool isExpanded = false;
  bool showWidget = false;
  bool _isPinned = false;
  double _scrollOffset = 0.0;
  double _pinnedPosition = 200.0;

  @override
  void _handleScroll() {
    if (kToolbarHeight <= _pinnedPosition) {
      // Scrolling up or at the top
      _pinTimer?.cancel();
      _isPinned = false;
    } else {
      // Scrolling down
      _pinTimer?.cancel();
      _pinTimer = Timer(_pinDelayDuration, () {
        setState(() {
          _isPinned = true;
        });
      });
    }
  }

  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _positionAnimation = Tween<double>(
      begin: _pinnedPosition,
      end: 0,
    ).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isPinned = true;
        });
      }
    });
  }

  void _handleButtonPress() {
    // Perform your button's action here
    void dispose() {
      _scrollController2.dispose();
      _animationController.dispose();
      super.dispose();
    }

    // Hide the button after it's pressed
    setState(() {
      isButtonVisible = false;
      isExpanded = !isExpanded;
    });

    if (!isExpanded) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isButtonVisible = true;
        });
      });
    } // Show the button again after a delay (2 seconds in this example)
  }

  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          notificationPredicate: (notification) {
            return false;
          },
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
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              setState(() {
                // Update the pinned state based on the scroll position
                _isPinned = notification.metrics.pixels > 300;
                _scrollOffset = notification.metrics.pixels;
              });
              _handleScroll();
            }
            return false;
          },
          child: Stack(
            children: [
              Positioned(
                child: CustomScrollView(
                    controller: _scrollController2,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Container(
                          child: Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 190, top: 30),
                              child: CircleAvatar(
                                backgroundColor: Color(0XFF777777),
                                radius: _mediaquery.size.width * 0.03,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/avt1.png"),
                                  radius: _mediaquery.size.width * 0.029,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Lathersalonaspen",
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontSize: _mediaquery.size.width *
                                                  0.0125,
                                              fontWeight: FontWeight.w700))),
                                  WidgetSpan(child: SizedBox(width: 10)),
                                  TextSpan(
                                      text: "Open Now ",
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontSize: _mediaquery.size.width *
                                                  0.0125,
                                              color: Color(0XFF007B2A),
                                              fontWeight: FontWeight.w700))),
                                  TextSpan(
                                      text: "- Closes 10 PM",
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontSize: _mediaquery.size.width *
                                                  0.0125,
                                              color: Color(0XFF777777),
                                              fontWeight: FontWeight.w700))),
                                ])),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text.rich(TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                              size: 25,
                                              color: Colors.amber,
                                              Icons.star)),
                                      TextSpan(
                                          text: "4.5",
                                          style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize:
                                                      _mediaquery.size.width *
                                                          0.0175,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                      TextSpan(
                                          text: " (1200)",
                                          style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize:
                                                      _mediaquery.size.width *
                                                          0.0125,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0XFF777777)))),
                                      WidgetSpan(child: SizedBox(width: 10)),
                                      WidgetSpan(
                                          child: Image(
                                              width: 22,
                                              height: 22,
                                              image: AssetImage(
                                                  "images/tichxanh.png"))),
                                      WidgetSpan(child: SizedBox(width: 10)),
                                      TextSpan(
                                          text: "Verified by Owner",
                                          style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF777777)))),
                                    ])),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                        width: _mediaquery.size.width * 0.5,
                                        child: CustomButtonBar()),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text("$screenwidth,$screenheight"),
                          ]),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "images/banner2.png")),
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
                                                image: AssetImage(
                                                    "images/banner2.png")),
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(10))),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "images/banner2.png")),
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
                                              image: AssetImage(
                                                  "images/banner2.png")),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "images/banner2.png")),
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
                                              image: AssetImage(
                                                  "images/banner2.png")),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "images/banner2.png")),
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
                                                image: AssetImage(
                                                    "images/banner2.png")),
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10))),
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
                            child: ElevatedButtonImage(),
                          ),
                        ]),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: 800),
                        sliver: SliverToBoxAdapter(
                          child: Stack(children: [
                            Positioned(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(right: 1440),
                                      child: Text(
                                        style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.w700)),
                                        "Services",
                                      )),
                                  GridViewServices(),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(right: 460),
                                      child: isButtonVisible
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _handleButtonPress();
                                                });
                                              },
                                              child:
                                                  Text.rich(TextSpan(children: [
                                                TextSpan(
                                                  text: 'View All',
                                                  style: GoogleFonts.mulish(
                                                      textStyle: TextStyle(
                                                          color: Colors.pink,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ),
                                                WidgetSpan(
                                                    child: Icon(
                                                  size: 20,
                                                  Icons.arrow_forward_outlined,
                                                  color: Colors.pink,
                                                ))
                                              ])),
                                            )
                                          : SizedBox()),
                                  Visibility(
                                      visible: isExpanded,
                                      child: Column(
                                        children: [
                                          GridViewServices(),
                                        ],
                                      )),
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 460),
                                    child: isButtonVisible
                                        ? SizedBox()
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                _handleButtonPress();
                                              });
                                            },
                                            child:
                                                Text.rich(TextSpan(children: [
                                              TextSpan(
                                                text: 'View All',
                                                style: GoogleFonts.mulish(
                                                    textStyle: TextStyle(
                                                        color: Colors.pink,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                              WidgetSpan(
                                                  child: Icon(
                                                size: 20,
                                                Icons.arrow_back_outlined,
                                                color: Colors.pink,
                                              ))
                                            ])),
                                          ),
                                  ),
                                  BottomMaterialLink(),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
              ),
              AnimatedPositioned(
                  width: 550,
                  duration: Duration(milliseconds: 1100),
                  top: _isPinned ? 0 : kToolbarHeight * 12,
                  right: 50,
                  child: Container(
                      height: 700,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              spreadRadius: 8,
                              color: Color.fromARGB(52, 0, 0, 0),
                              blurRadius: 5)
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Location & Hours",
                                  style: GoogleFonts.mulish(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 520,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: MapApi2(),
                          ),
                          Container(
                            height: 60,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xff333333),
                                    child: Image(
                                        width: 22,
                                        height: 22,
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage("images/distance.png"))),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "7400 Hazard Ave Westminster,\nCA 92683",
                                  style: GoogleFonts.mulish(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            Size(100, 40)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(10)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xff333333))),
                                    onPressed: () {},
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        "Directions",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mulish(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}

class RenderStickySliver extends RenderSliverToBoxAdapter {
  RenderStickySliver({RenderConstrainedBox? child}) : super(child: child);
  @override
  void performLayout() {
    var myCurrentConstraints = constraints;

    geometry = SliverGeometry.zero;

    child?.layout(
      constraints.asBoxConstraints(),
      parentUsesSize: true,
    );
    double childExtent = child?.size.height ?? 0;

    geometry = SliverGeometry(
        paintExtent: childExtent,
        maxPaintExtent: childExtent,
        paintOrigin: constraints.scrollOffset);
    setChildParentData(child!, constraints, geometry!);
  }
}

class StickySliver extends SingleChildRenderObjectWidget {
  StickySliver({Widget? child, Key? key}) : super(child: child, key: key);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStickySliver();
  }
}

class GridViewServices extends StatelessWidget {
  const GridViewServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              InkWell(
                  onTap: () {},
                  child: CustomMouseRegion(
                      "images/banner2.png", "Nail Extension")),
              SizedBox(width: 20),
              InkWell(
                  onTap: () {},
                  child: CustomMouseRegion("images/banner3.png", "Nail Art")),
              SizedBox(width: 20),
              InkWell(
                  onTap: () {},
                  child: CustomMouseRegion("images/banner4.png", "Manicure")),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              InkWell(
                  onTap: () {},
                  child: CustomMouseRegion(
                      "images/banner2.png", "Nail Extension")),
              SizedBox(width: 20),
              InkWell(
                  onTap: () {},
                  child: CustomMouseRegion("images/banner3.png", "Nail Art")),
              SizedBox(width: 20),
              InkWell(
                  onTap: () {},
                  child: CustomMouseRegion("images/banner4.png", "Manicure")),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildNestedCustomScrollView(String title) {
  return StickySliver(
    child: Stack(
      children: [
        Container(
          width: 300,
          height: 450,
          color: Colors.blue,
          child: Text("Hello"),
        )
      ],
    ),
  );
}

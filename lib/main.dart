// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, override_on_non_overriding_member, unused_field, unused_element, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/bottom_material/bottom_links.dart';
import 'package:homepage/button_material.dart/button_bar.dart';
import 'package:homepage/button_material.dart/button_image.dart';
import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:homepage/material_custom.dart/mouse_region.dart';
import 'material_custom.dart/google_map_api2.dart';

const List<String> list = <String>[
  'Open Now - Closes 10 PM ',
  'Open Now - Closes 12 PM ',
  'Open Now - Closes 2 PM ',
  'Open Now - Closes 1 PM '
];
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
  String dropdownValue = list.firstOrNull.toString();
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;
  late AnimationController _controller;
  late ScrollController _scrollController;
  late Timer _pinTimer;
  @override
  void dispose() {
    _pinTimer.cancel();
    super.dispose();
  }

  Duration _pinDelayDuration = Duration(milliseconds: 100);
  ScrollController _scrollController2 = ScrollController();
  bool isButtonVisible = true;
  bool isExpanded = false;
  bool showWidget = false;
  bool _isPinned = false;
  double _scrollOffset = 0.0;
  double _pinnedPosition = 500.0;

  @override
  void _handleScroll() {
    if (-_scrollOffset <= _pinnedPosition) {
      // Scrolling up or at the top
      _pinTimer.cancel();
      _isPinned = false;
    } else {
      // Scrolling down
      _pinTimer.cancel();
      _pinTimer = Timer(_pinDelayDuration, () {
        setState(() {
          _isPinned = true;
        });
      });
    }
  }

  void initState() {
    super.initState();
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
                                radius: _mediaquery.size.width * 0.025,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/avt1.png"),
                                  radius: _mediaquery.size.width * 0.0245,
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
                                      width: 200,
                                    ),
                                    SizedBox(
                                        width: _mediaquery.size.width * 0.5,
                                        child: CustomButtonBar()),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 15,
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
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 25,
                        ),
                      ),
                      SliverToBoxAdapter(
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
                                    padding: const EdgeInsets.only(right: 460),
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
                                          child: Text.rich(TextSpan(children: [
                                            TextSpan(
                                              text: 'Back',
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
                    ]),
              ),
              AnimatedPositioned(
                  width: 550,
                  duration: Duration(milliseconds: 1100),
                  top: _isPinned ? 0 : _pinnedPosition + 200,
                  right: 20,
                  child: Container(
                      height: 830,
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
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 65,
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
                                      height: 20,
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
                                        image: AssetImage("images/phone.png"))),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "613-555-0184",
                                  style: GoogleFonts.mulish(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 220,
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
                                      height: 20,
                                      child: Text(
                                        "Call",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mulish(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Price: ",
                                style: GoogleFonts.mulish(
                                    color: Color(0xff333333), fontSize: 20),
                              ),
                              Text("\$149.99",
                                  style: GoogleFonts.mulish(
                                      color: Color(0xffD3427A),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            width: 500,
                            height: 50,
                            color: Color(0xffF7F7F7),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              iconSize: 30,
                              borderRadius: BorderRadius.circular(10),
                              padding: EdgeInsets.only(left: 20),
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 190),
                                child: const Icon(Icons.arrow_drop_down),
                              ),
                              elevation: 16,
                              underline: SizedBox(),
                              style: const TextStyle(
                                  color: Color(0xff007B2A),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: value.substring(0, 9),
                                        style: GoogleFonts.mulish(
                                            color: Color(0xff007B2A))),
                                    TextSpan(
                                        text: value.substring(9, 23),
                                        style: GoogleFonts.mulish(
                                            color: Color(0xff777777)))
                                  ])),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "www.lathersalonaspen.com.au",
                                style: GoogleFonts.mulish(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "Social Media",
                                style: GoogleFonts.mulish(fontSize: 20),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Image(
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                  image: AssetImage("images/fbfb.png")),
                              SizedBox(
                                width: 15,
                              ),
                              Image(
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                  image: AssetImage("images/insins.png")),
                              SizedBox(
                                width: 15,
                              ),
                              Image(
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                  image:
                                      AssetImage("images/twittertwitter.png")),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Container(
                                width: 500,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  color: Color(0xffD3427A),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Book Now",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.mulish(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ))
                        ],
                      ))),
            ],
          ),
        ));
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

// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/rendering.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/bottom_material/bottom_links.dart';
import 'package:homepage/button_material.dart/button_bar.dart';
import 'package:homepage/button_material.dart/viewall_button.dart';

import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:homepage/material_custom.dart/google_map_api.dart';
import 'package:homepage/material_custom.dart/gridview_image.dart';

import 'package:homepage/material_custom.dart/mouse_region.dart';
import 'package:homepage/page_material/tag_state.dart';

List<String> suggestTags = [
  "Tech Name 1",
  "Tech Name 2",
  "Services 1",
  "Services 2",
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
      home: const ReviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPage();
}

class _ReviewPage extends State<ReviewPage> {
  bool isExpanded = false;
  bool showWidget = false;
  int numberOfPages = 15;
  int currentPage = 0;
  late ScrollController _scrollController;
  bool _isPinned = false;
  bool isDesktopwidth(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700;
  bool isDesktopheight(BuildContext context) =>
      MediaQuery.of(context).size.height >= 1000;
  bool isMobilewidth(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool isMobileheight(BuildContext context) =>
      MediaQuery.of(context).size.height < 900;
  @override
  double rating = 4;
  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isDesktopwidth(context) && isDesktopheight(context))
                    Column(
                      children: [
                        Container(
                          width: 850,
                          height: 1000,
                          decoration: BoxDecoration(
                              color: Color(0XFFCDCDCD),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                  width: double.maxFinite,
                                  height: 800,
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Select Your Rate",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          RatingBar.builder(
                                            initialRating: 0,
                                            minRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Add a Headline",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              width: 780,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300)),
                                              child: TextField(
                                                minLines: 1,
                                                maxLines: 1,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                maxLength: 50,
                                                decoration: InputDecoration(
                                                    counterText: "",
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 20, top: 10),
                                                    hintText:
                                                        "What's most important to know?",
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Add a Written Review",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              width: 780,
                                              height: 180,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: TextField(
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                maxLength: 500,
                                                minLines: 1,
                                                maxLines: 6,
                                                decoration: InputDecoration(
                                                    counterText: "",
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 20, top: 40),
                                                    hintText:
                                                        "What did you like or dislike about service/ products?",
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "+ Add Techs/ Services for Reviews",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              width: 780,
                                              height: 180,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: TagState())
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 650,
                        height: 1000,
                        color: Colors.amber,
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}

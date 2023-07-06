// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homepage/button_material.dart/button_bar.dart';
import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MoreReview extends StatefulWidget {
  const MoreReview({super.key});

  @override
  State<MoreReview> createState() => _MoreReview();
}

class _MoreReview extends State<MoreReview> {
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
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0XFFCDCDCD)),
                        borderRadius: BorderRadius.circular(20)),
                    width: 1550,
                    height: 900,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Reviews",
                                style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        height: 1)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text.rich(TextSpan(children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: RatingBar.builder(
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemSize: 40,
                                    itemCount: 5,
                                    minRating: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Text(
                                      "4.5 ",
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              height: 1)),
                                    )),
                                WidgetSpan(child: Text("Out of 5"))
                              ])),
                              Text(
                                "12345 Customer Rating",
                                style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(20),
                                width: 300,
                                animation: true,
                                leading: Text("5 star",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                trailing: Text("80%",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: 0.8,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0XFF76DC99),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(20),
                                width: 300,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: 0.12,
                                leading: Text("4 star",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                trailing: Text("9%",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0xffB7EA83),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(20),
                                width: 300,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: 0.08,
                                leading: Text("3 star",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                trailing: Text("4%",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0xffF6D757),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(20),
                                width: 300,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: 0.06,
                                leading: Text("2 star",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                trailing: Text("2%",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0xffFAB851),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(20),
                                width: 300,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: 0.04,
                                leading: Text("1 star",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                trailing: Text("1%",
                                    style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Color(0xffF17A55),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Location & Hours",
                                style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        height: 1)),
                              ),
                              Container(
                                height: 500,
                                width: 500,
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(37.4219999, -122.0862462)),
                                  onMapCreated:
                                      (GoogleMapController controller) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 130),
                          child: Column(
                            children: [
                              Text("Review with Images"),
                              Row(
                                children: [
                                  Container(
                                    width: 190,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("images/banner1.png")),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 190,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("images/banner1.png")),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 190,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("images/banner1.png")),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 190,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("images/banner1.png")),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                              Text("View all the images"),
                              Row(
                                children: [
                                  Text("Top Reviews"),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Color(0xffCDCDCD)),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    width: 250,
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                                  hintText:
                                                      'Search by keyword...',
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 20))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            radius: 24,
                                            backgroundColor: Color(
                                                0XFFD3427A), //<-- SEE HERE
                                            child: IconButton(
                                              iconSize: 35,
                                              icon: Icon(
                                                Icons.search,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        fixedSize: MaterialStateProperty.all(
                                            Size(170, 50)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                                width: 2,
                                                color: Color(0XFFCDCDCD)),
                                          ),
                                        ),
                                      ),
                                      child: Text.rich(
                                        TextSpan(children: [
                                          WidgetSpan(child: SizedBox(width: 5)),
                                          TextSpan(
                                              text: "Sort by: ",
                                              style: GoogleFonts.mulish(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0XFF777777),
                                                      fontSize: 20))),
                                          TextSpan(
                                              text: "All",
                                              style: GoogleFonts.mulish(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 20))),
                                          WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: Icon(
                                                  color: Color.fromARGB(
                                                      212, 14, 14, 11),
                                                  size: 25,
                                                  Icons.arrow_drop_down)),
                                        ]),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        fixedSize: MaterialStateProperty.all(
                                            Size(200, 50)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                                width: 2,
                                                color: Color(0XFFCDCDCD)),
                                          ),
                                        ),
                                      ),
                                      child: Text.rich(
                                        TextSpan(children: [
                                          WidgetSpan(child: SizedBox(width: 5)),
                                          TextSpan(
                                              text: "Filter by rating",
                                              style: GoogleFonts.mulish(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0XFF777777),
                                                      fontSize: 20))),
                                          WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: Icon(
                                                  color: Color.fromARGB(
                                                      212, 14, 14, 11),
                                                  size: 25,
                                                  Icons.arrow_drop_down)),
                                        ]),
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}

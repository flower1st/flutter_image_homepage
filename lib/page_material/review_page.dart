// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/rendering.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/bottom_material/bottom_links.dart';
import 'package:homepage/button_material.dart/button_bar.dart';

import 'package:homepage/image_material.dart/image_picker.dart';

import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:homepage/page_material/more_reviewpage.dart';

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

  bool isDesktopwidth(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700;
  bool isDesktopheight(BuildContext context) =>
      MediaQuery.of(context).size.height >= 1000;
  bool isMobilewidth(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool isMobileheight(BuildContext context) =>
      MediaQuery.of(context).size.height < 900;
  @override
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
                    Column1_reviewpage(),
                  SizedBox(
                    width: 40,
                  ),
                  Column2_reviewpage(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: BottomMaterialLink(),
            )
          ]),
        ],
      ),
    ));
  }
}

class Column2_reviewpage extends StatelessWidget {
  const Column2_reviewpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0XFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0XFFCDCDCD))),
          width: 650,
          height: 1000,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 990,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        WidgetSpan(
                          child: Text(
                            "Newest Review",
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w800)),
                          ),
                        ),
                        WidgetSpan(
                            child: SizedBox(
                          width: 280,
                        )),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return MoreReview();
                                },
                              ));
                            },
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'View All',
                                style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                              WidgetSpan(
                                  child: Icon(
                                size: 20,
                                Icons.arrow_forward_outlined,
                                color: Colors.pink,
                              ))
                            ])),
                          ),
                        ),
                      ])),
                      Column(children: [
                        CustomerReview(),
                        Divider(endIndent: 50, height: 10),
                        CustomerReview(),
                        Divider(endIndent: 50, height: 10),
                        CustomerReview(),
                        Divider(endIndent: 50, height: 10),
                        CustomerReview(),
                      ]),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CustomerReview extends StatelessWidget {
  const CustomerReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: SizedBox(
            width: 800,
            height: 200,
            child: ListTile(
              visualDensity: VisualDensity(vertical: 4),
              leading: Container(
                width: 75,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/avt1.png")),
                  borderRadius: BorderRadius.circular(300),
                  border: Border.all(width: 2, color: Colors.grey),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(right: 198, top: 15),
                child: Column(children: [
                  Text("Charlotte Martin"),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 23,
                    itemCount: 5,
                    maxRating: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ]),
              ),
              trailing: Container(
                height: double.maxFinite,
                width: 150,
                child: Stack(children: [
                  Positioned(
                    bottom: 50,
                    right: 70,
                    child: Text(
                      "1 day ago",
                      style: GoogleFonts.mulish(
                          textStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Text.rich(TextSpan(children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: IconButton(
                            onPressed: () {},
                            color: Color(0XFF007AB5),
                            icon: Icon(size: 20, Icons.thumb_up)),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.bottom,
                        child: Text(
                          "42",
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                      )
                    ])),
                  ),
                ]),
              ),
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                  'Lorem Ipsum is simply dummy text of the printing'),
              SizedBox(
                height: 10,
              ),
              Text(
                  style: GoogleFonts.mulish(
                      textStyle:
                          TextStyle(color: Color(0XFF777777), fontSize: 18)),
                  'The Pacific Grove Chamber of Commerce ould like to thank\neLab Communications and Mr. Will Elkadi for all the efforts.'),
            ],
          ),
        ),
      ],
    );
  }
}

class Column1_reviewpage extends StatelessWidget {
  const Column1_reviewpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 850,
          height: 1000,
          decoration: BoxDecoration(
              color: Color(0XFFF5F5F5),
              border: Border.all(width: 2, color: Color(0XFFCDCDCD)),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                  width: double.maxFinite,
                  height: 990,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  borderRadius: BorderRadius.circular(300)),
                              child: TextField(
                                minLines: 1,
                                maxLines: 1,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 50,
                                decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding:
                                        EdgeInsets.only(left: 20, top: 10),
                                    hintText: "What's most important to know?",
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
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 500,
                                minLines: 1,
                                maxLines: 6,
                                decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding:
                                        EdgeInsets.only(left: 20, top: 40),
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
                                  borderRadius: BorderRadius.circular(30)),
                              child: TagState()),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                              width: double.maxFinite, child: ImageUploader()),
                          SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(1),
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 60)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 2, color: Color(0XFFD3427A)),
                                  ),
                                ),
                              ),
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Post Review",
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0XFFD3427A),
                                              fontSize: 20))),
                                ]),
                              )),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

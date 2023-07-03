// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class BottomMaterialLink extends StatefulWidget {
  @override
  State<BottomMaterialLink> createState() => _BottomMaterialLink();
}

class _BottomMaterialLink extends State<BottomMaterialLink> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(color: Color(0XFFF7F7F7)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Quick Links\n',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF333333)),
                  )),
              WidgetSpan(child: SizedBox(height: 80)),
              TextSpan(
                  text: "About\n\n"
                      "Services\n\n"
                      "Salon Owner\n",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0XFF7777777),
                      height: 1.4,
                      fontSize: 15,
                    ),
                  )),
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Information\n',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF333333)),
                  )),
              WidgetSpan(child: SizedBox(height: 80)),
              TextSpan(
                  text: "Testimonials\n\n"
                      "Contact Us\n\n"
                      "Help\n",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0XFF7777777),
                      height: 1.4,
                      fontSize: 15,
                    ),
                  )),
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'nail360\n',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF333333)),
                  )),
              WidgetSpan(child: SizedBox(height: 80)),
              TextSpan(
                  text: "Terms and Conditions\n\n"
                      "Refund Policy\n\n"
                      "Privacy\n",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0XFF7777777),
                      height: 1.4,
                      fontSize: 15,
                    ),
                  )),
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Contact Us\n',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF333333)),
                  )),
              WidgetSpan(child: SizedBox(height: 80)),
              TextSpan(
                  text: "12345 Little Lonsdale St,\n"
                      "Melbourne\n\n"
                      "Phone: (123) 123-456\n\n"
                      "E-Mail: office@nail360.com\n",
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0XFF7777777),
                      height: 1.4,
                      fontSize: 15,
                    ),
                  )),
            ])),
          ]),
        ),
        Divider(
          height: 10,
          thickness: 5,
          indent: 0,
          endIndent: 0,
          color: Color(0XFFEAE5E5),
        ),
        Container(
            width: 1500,
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Copyright © 2023 nail360.com. All rights reserved."),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              image: AssetImage("images/fbfb.png"))),
                      SizedBox(width: 20),
                      InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              image: AssetImage("images/insins.png"))),
                      SizedBox(width: 20),
                      InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              image: AssetImage("images/twittertwitter.png"))),
                      SizedBox(width: 20),
                      InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              image: AssetImage("images/ininin.png"))),
                      SizedBox(width: 20),
                      InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              image: AssetImage("images/goldold.png"))),
                      SizedBox(width: 20),
                      InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              image: AssetImage("images/ytyt.png"))),
                    ],
                  ),
                ])),
      ],
    );
  }
}

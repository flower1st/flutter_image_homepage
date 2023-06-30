// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/main.dart';

void main() {
  runApp(MyApp());
}

class DialogImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Stack(children: [
        AlertDialog(
          title: Text('Image Dialog'),
          content: Column(mainAxisSize: MainAxisSize.max, children: [
            Image.asset(
              height: 650,
              width: 900,
              'images/cityview.png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
            Container(
              color: Color.fromARGB(255, 18, 192, 36),
              width: double.infinity,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 253, 252, 252),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/avt1.png"),
                        radius: 29,
                      ),
                    ),
                  ),
                  Positioned(
                    width: 200,
                    height: 150,
                    top: 40,
                    left: 40,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Johan Martin",
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700))),
                      WidgetSpan(child: SizedBox(width: 10)),
                    ])),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 100,
                    child: Text.rich(TextSpan(children: [
                      WidgetSpan(
                          child:
                              Icon(size: 25, color: Colors.amber, Icons.star)),
                      TextSpan(
                          text: " (1200)",
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0XFF777777)))),
                      WidgetSpan(child: SizedBox(width: 10)),
                    ])),
                  ),
                ],
              ),
            ),
          ]),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
        Positioned(
          left: 410,
          top: 450,
          child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(1),
                fixedSize: MaterialStateProperty.all(Size(50, 55)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 255, 255)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(300.0),
                    side: BorderSide(width: 3, color: Color(0XFF682243)),
                  ),
                ),
              ),
              child: Icon(
                  size: 29,
                  color: Color(0XFF682243),
                  Icons.arrow_back_rounded)),
        ),
        Positioned(
          right: 410,
          top: 450,
          child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(1),
                fixedSize: MaterialStateProperty.all(Size(50, 55)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 255, 255)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(300.0),
                    side: BorderSide(width: 3, color: Color(0XFF682243)),
                  ),
                ),
              ),
              child: Icon(
                  size: 29,
                  color: Color(0XFF682243),
                  Icons.arrow_forward_rounded)),
        ),
      ]),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/material_custom.dart/mouse_region.dart';

class ViewAllButton extends StatefulWidget {
  @override
  _ViewAllButtonState createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<ViewAllButton> {
  bool showAll = false;
  bool isVisible = true;
  void toggleShowAll() {
    setState(() {
      isVisible = false;
      showAll = !showAll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 700),
          child: Visibility(
            visible: isVisible,
            child: InkWell(
              onTap: toggleShowAll,
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
        ),
        Visibility(
          visible: showAll,
          child: Column(
            children: [
              Row(
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
                      child:
                          CustomMouseRegion("images/banner3.png", "Nail Art")),
                  SizedBox(width: 20),
                  InkWell(
                      onTap: () {},
                      child:
                          CustomMouseRegion("images/banner4.png", "Manicure")),
                ],
              ),
              SizedBox(height: 20),
              Row(
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
                      child:
                          CustomMouseRegion("images/banner3.png", "Nail Art")),
                  SizedBox(width: 20),
                  InkWell(
                      onTap: () {},
                      child:
                          CustomMouseRegion("images/banner4.png", "Manicure")),
                ],
              ),
              SizedBox(height: 20),
              Row(
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
                      child:
                          CustomMouseRegion("images/banner3.png", "Nail Art")),
                  SizedBox(width: 20),
                  InkWell(
                      onTap: () {},
                      child:
                          CustomMouseRegion("images/banner4.png", "Manicure")),
                ],
              ),
              Visibility(
                visible: true,
                child: InkWell(
                  onTap: toggleShowAll,
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
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('View All Button Example')),
        body: Center(
          child: ViewAllButton(),
        ),
      ),
    );
  }
}

// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/main.dart';

void main() {
  runApp(MyApp());
}

int _currentImageIndex = 0;
List<String> imageList = [
  'images/banner2.png',
  'images/banner3.png',
  'images/banner4.png',
  'images/banner1.png',
  'images/banner5.png',
  'images/banner6.png',
  'images/banner7.png',
  'images/banner8.png',
  'images/banner9.png',
  'images/banner10.png',
  'images/banner11.png',
  'images/banner4.png',
  'images/banner3.png',
  'images/banner7.png',
];

class DialogImage extends StatefulWidget {
  @override
  State<DialogImage> createState() => _DialogImageState();
}

class _DialogImageState extends State<DialogImage> {
  void _switchImage() {
    setState(() {
      if (_currentImageIndex < imageList.length - 1) {
        _currentImageIndex++;
      } else {
        // Stop at the last index
      }
    });
  }

  void _backImage() {
    setState(() {
      if (_currentImageIndex > 0) {
        _currentImageIndex--;
      } else {
        // Stop at the last index
      }
    });
  }

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
              width: 980,
              imageList[_currentImageIndex],
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
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
              onPressed: () {
                _backImage();
              },
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
              onPressed: () {
                _switchImage();
              },
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

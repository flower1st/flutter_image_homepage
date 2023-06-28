// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homepage/main.dart';

void main() {
  runApp(MyApp());
}

class GridViewImage extends StatelessWidget {
  final List<String> imageList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(),
          child: GridView.builder(
              itemCount: imageList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10),
              itemBuilder: ((context, index) {
                return Container(
                  width: 300,
                  height: 300,
                  child: Image(
                      fit: BoxFit.cover, image: AssetImage(imageList[index])),
                );
              })),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homepage/main.dart';
import 'package:homepage/material_custom.dart/dialog_image_box.dart';
import 'package:number_paginator/number_paginator.dart';

void main() {
  runApp(MyApp());
}

class GridViewImage extends StatefulWidget {
  @override
  State<GridViewImage> createState() => _GridViewImage();
}

class _GridViewImage extends State<GridViewImage> {
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
  int numberOfPages = 15;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfPages,
        (index) => Center(
              child: Text(
                "Page Number:${index + 1}",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ));
    return Container(
      child: GridView.builder(
        itemCount: imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: 3, // Number of columns in the grid
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
        ),
        itemBuilder: (context, index) {
          String imageUrl = imageList[index];
          return Container(
            child: InkWell(
              onTap: () {
                _showImageDialog(context, imageUrl);
              },
              child: Image.asset(
                width: 500,
                height: 320,
                imageList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int currentImageIndex = imageList.indexOf(imageUrl);
        return StatefulBuilder(builder: (context, setState) {
          void _switchImage() {
            setState(() {
              if (currentImageIndex < imageList.length - 1) {
                currentImageIndex++;
              } else {
                // Stop at the last index
              }
            });
          }

          void _backImage() {
            setState(() {
              if (currentImageIndex > 0) {
                currentImageIndex--;
              } else {
                // Stop at the last index
              }
            });
          }

          return Stack(children: [
            AlertDialog(
              title: Text('Image Dialog'),
              content: Column(mainAxisSize: MainAxisSize.max, children: [
                Image(
                  image: AssetImage(imageList[currentImageIndex]),
                  height: 650,
                  width: 980,
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
          ]);
        });
      },
    );
  }
}

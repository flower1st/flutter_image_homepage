// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/material_custom.dart/custom_profilename.dart';

class CustomMouseRegion extends StatefulWidget {
  final String path;
  final String namepath;
  CustomMouseRegion(this.path, this.namepath);
  @override
  State<CustomMouseRegion> createState() => _CustomMouseRegion();
}

class _CustomMouseRegion extends State<CustomMouseRegion> {
  bool isHover = false;

  double rating = 4.5;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (f) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (f) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: 2, color: isHover ? Colors.pink : Colors.grey),
        ),
        duration: Duration(milliseconds: 100),
        width: isHover ? 350 : 350,
        height: isHover ? 350 : 350,
        child: Stack(
          children: [
            Container(
                width: 350,
                height: 430,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 230, 224, 224),
                )),
            ProfileImage(name: widget.path),
            Positioned(
              top: 195,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Positioned(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: widget.namepath,
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ])),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 20,
                bottom: 45,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Lorem Ipsum is simply dummy text\nof '
                          'the printing  typesetting industry.\n',
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ]))),
            Positioned(
                left: 15,
                bottom: 20,
                child: Text.rich(TextSpan(children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.bottom,
                    child: RatingBar.builder(
                        itemSize: 25,
                        minRating: 1,
                        itemCount: 1,
                        unratedColor: Colors.amber,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) => setState(() {
                              this.rating = rating;
                            })),
                  ),
                  TextSpan(
                      text: '4.5',
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                      )),
                  TextSpan(
                      text: '\t(1200)',
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(fontSize: 15, wordSpacing: 1),
                      )),
                ]))),
            Positioned(
              right: 20,
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {},
                onHover: (isHover) {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(140, 45)),
                  backgroundColor: MaterialStateProperty.all<Color>(isHover
                      ? Colors.pink
                      : Color.fromARGB(255, 248, 248, 248)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                          width: 1,
                          color: isHover ? Colors.pink : Colors.black),
                    ),
                  ),
                ),
                child: Text(
                  "Quick Book",
                  style: TextStyle(
                      color: isHover ? Colors.white : Colors.black,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

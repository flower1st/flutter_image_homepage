// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/material_custom.dart/gridview_image.dart';
import 'package:homepage/page_material/review_page.dart';

class CustomButtonBar extends StatefulWidget {
  @override
  State<CustomButtonBar> createState() => _CustomButtonBar();
}

class _CustomButtonBar extends State<CustomButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(1),
          fixedSize: MaterialStateProperty.all(Size(150, 50)),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFD3427A)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(width: 3, color: Color(0XFFD3427A)),
            ),
          ),
        ),
        child: Text(
          "Book Now",
          style: GoogleFonts.mulish(
              textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
        ),
      ),
      SizedBox(width: 20),
      ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ReviewPage();
              },
            ));
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(1),
            fixedSize: MaterialStateProperty.all(Size(220, 50)),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(width: 3, color: Color(0XFFCDCDCD)),
              ),
            ),
          ),
          child: Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image(
                      width: 25,
                      height: 25,
                      filterQuality: FilterQuality.high,
                      image: AssetImage("images/icon2.png"))),
              WidgetSpan(child: SizedBox(width: 10)),
              TextSpan(
                  text: "Write a Review",
                  style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF777777),
                          fontSize: 20))),
            ]),
          )),
      SizedBox(width: 20),
      ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(1),
            fixedSize: MaterialStateProperty.all(Size(170, 50)),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(width: 3, color: Color(0XFFCDCDCD)),
              ),
            ),
          ),
          child: Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                      color: Color.fromARGB(212, 14, 14, 11),
                      size: 30,
                      Icons.add_sharp)),
              WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(
                  text: "Add Photo",
                  style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF777777),
                          fontSize: 20))),
            ]),
          )),
      SizedBox(width: 20),
      ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(1),
            fixedSize: MaterialStateProperty.all(Size(130, 50)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(width: 3, color: Color(0XFFCDCDCD)),
              ),
            ),
          ),
          child: Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                      color: Color.fromARGB(212, 14, 14, 11),
                      size: 25,
                      Icons.share_outlined)),
              WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(
                  text: "Share",
                  style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF777777),
                          fontSize: 20))),
            ]),
          )),
      SizedBox(width: 20),
      ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(1),
            fixedSize: MaterialStateProperty.all(Size(130, 50)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(width: 3, color: Color(0XFFCDCDCD)),
              ),
            ),
          ),
          child: Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                      color: Color.fromARGB(212, 14, 14, 11),
                      size: 25,
                      Icons.favorite_border)),
              WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(
                  text: "Save",
                  style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF777777),
                          fontSize: 20))),
            ]),
          )),
    ]);
  }
}

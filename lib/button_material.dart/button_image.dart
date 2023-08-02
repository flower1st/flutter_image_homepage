// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/material_custom.dart/gridview_image.dart';

class ElevatedButtonImage extends StatelessWidget {
  const ElevatedButtonImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text('Show all Photos'),
                          SizedBox(
                            width: 400,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(1),
                                fixedSize:
                                    MaterialStateProperty.all(Size(130, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 3, color: Color(0XFFCDCDCD)),
                                  ),
                                ),
                              ),
                              child: Text.rich(
                                TextSpan(children: [
                                  WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                          color:
                                              Color.fromARGB(212, 14, 14, 11),
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
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(1),
                                fixedSize:
                                    MaterialStateProperty.all(Size(130, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 3, color: Color(0XFFCDCDCD)),
                                  ),
                                ),
                              ),
                              child: Text.rich(
                                TextSpan(children: [
                                  WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                          color:
                                              Color.fromARGB(212, 14, 14, 11),
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
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(1),
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 3, color: Color(0XFFCDCDCD)),
                                  ),
                                ),
                              ),
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Sort by: ",
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0XFF777777),
                                              fontSize: 20))),
                                  TextSpan(
                                      text: "All",
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 20))),
                                  WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                          color:
                                              Color.fromARGB(212, 14, 14, 11),
                                          size: 35,
                                          Icons.arrow_drop_down)),
                                ]),
                              )),
                          SizedBox(
                            width: 500,
                          ),
                          IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                    ],
                  ),
                  content: Container(
                      width: 1500, height: 1000, child: GridViewImage()),
                );
              });
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(1),
          fixedSize: MaterialStateProperty.all(Size(190, 50)),
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
                    size: 20,
                    Icons.grid_3x3_outlined)),
            WidgetSpan(child: SizedBox(width: 5)),
            TextSpan(
                text: "Show all Photos",
                style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF777777),
                        fontSize: 20))),
          ]),
        ));
  }
}

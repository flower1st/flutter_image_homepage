// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/material_custom.dart/gridview_image.dart';
import 'package:homepage/page_material/search_page.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.center,
            colors: [
              Color(0XFF1E1E1E),
              Color.fromARGB(255, 33, 31, 31),
            ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Image.asset(
              "images/logo.png",
              alignment: Alignment.centerRight,
              width: 280,
              height: 250,
            ),
          ),
          SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color.fromARGB(255, 255, 255, 255)),
            width: 800,
            height: 50,
            child: Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Search by name',
                          contentPadding: EdgeInsets.only(left: 30))),
                ),
                const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey),
                new Flexible(
                  child: InkWell(
                    child: new TextField(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SearchPage();
                            },
                          ));
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_pin),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Address, city state or zip',
                            contentPadding: EdgeInsets.only(left: 50))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0XFFD3427A), //<-- SEE HERE
                    child: IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(170, 55)),
                backgroundColor: MaterialStateProperty.all(Color(0XFFD3427A)),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(width: 3, color: Color(0XFFD3427A)),
                  ),
                ),
              ),
              child: Text(
                "For Bussiness",
                style: GoogleFonts.mulish(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(26)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              child: Text(
                "Log In",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0XFFD3427A)),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(26)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(width: 3, color: Color(0XFFD3427A)),
                  ),
                ),
              ),
              child: Text("Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}

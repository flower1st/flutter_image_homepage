// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:homepage/page_material/search_page.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1650;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 1650;
  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container1();
      },
    );
  }
}

class Container1 extends StatelessWidget {
  const Container1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context);
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
              width: _mediaquery.size.width * 0.2,
            ),
          ),
          SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color.fromARGB(255, 255, 255, 255)),
            width: _mediaquery.size.width * 0.4,
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
                        onChanged: (value) {},
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
                fixedSize: MaterialStateProperty.all(
                    Size(_mediaquery.size.width * 0.1, 55)),
                backgroundColor: MaterialStateProperty.all(Color(0XFFD3427A)),
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
                    textStyle: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                fixedSize: MaterialStateProperty.all(
                    Size(_mediaquery.size.width * 0.05, 55)),
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
                fixedSize: MaterialStateProperty.all(
                    Size(_mediaquery.size.width * 0.05, 55)),
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

class Container2 extends StatelessWidget {
  const Container2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context);
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
              width: _mediaquery.size.width * 0.125,
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color.fromARGB(255, 255, 255, 255)),
            width: 500,
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
                        onChanged: (value) {},
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
                    radius: 15,
                    backgroundColor: Color(0XFFD3427A), //<-- SEE HERE
                    child: IconButton(
                      iconSize: 15,
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
                fixedSize: MaterialStateProperty.all(Size(120, 45)),
                backgroundColor: MaterialStateProperty.all(Color(0XFFD3427A)),
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
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
              ),
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                fixedSize: MaterialStateProperty.all(Size(80, 45)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              child: Text(
                "Log In",
                style: TextStyle(color: Colors.black, fontSize: 12),
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
                fixedSize: MaterialStateProperty.all(Size(80, 45)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(width: 3, color: Color(0XFFD3427A)),
                  ),
                ),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

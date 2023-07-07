// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/bottom_material/bottom_links.dart';

import 'package:homepage/material_custom.dart/custom_appbar.dart';
import 'package:homepage/material_custom.dart/google_map_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List names = List.generate(30, (index) => ("Customer$index"));
  List designations = List.generate(30, (index) => ("Title$index"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomAppBar(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.center,
                  colors: [
                    Color(0XFF1E1E1E),
                    Color.fromARGB(255, 33, 31, 31),
                  ]),
            ),
          ),
          toolbarHeight: 100,
          pinned: true,
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Container(
                color: Colors.amber,
                width: 1070,
                height: 1500,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 30,
                      ),
                      child: Row(
                        children: [
                          Text("Over 222 Salons"),
                          SizedBox(
                            width: 570,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 2, color: Color(0XFFCDCDCD)),
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
                                          Icons.filter_alt_outlined)),
                                  WidgetSpan(child: SizedBox(width: 5)),
                                  TextSpan(
                                      text: "Filters",
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
                                elevation: MaterialStateProperty.all(0),
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 2, color: Color(0XFFCDCDCD)),
                                  ),
                                ),
                              ),
                              child: Text.rich(
                                TextSpan(children: [
                                  WidgetSpan(child: SizedBox(width: 5)),
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
                                          size: 25,
                                          Icons.arrow_drop_down)),
                                ]),
                              )),
                        ],
                      ),
                    ),
                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Card(
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: Colors.grey,
                                  ))),
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: [
                                                Positioned(
                                                  child: Container(
                                                    width: 200,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              "https://nationaltoday.com/wp-content/uploads/2021/12/Festival-of-Owls-Week-1200x834.jpg")),
                                                      color: Color.fromARGB(
                                                          255, 55, 18, 164),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    child: Icon(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 0, 0, 0),
                                                        size: 30,
                                                        shadows: [
                                                          Shadow(
                                                              blurRadius: 300,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      251,
                                                                      251))
                                                        ],
                                                        Icons.favorite)),
                                              ],
                                            ),
                                            SizedBox(width: 5),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  names[index],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  designations[index],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Positioned(
                left: 1090,
                child: Column(
                  children: [
                    Container(
                        child: Container(
                            width: 750, height: 1000, child: onMap(context)))
                  ],
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BottomMaterialLink(),
        )
      ]),
    );
  }
}

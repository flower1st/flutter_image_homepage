// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last, unnecessary_new, unnecessary_null_comparison, prefer_final_fields, unused_element, curly_braces_in_flow_control_structures

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collection/collection.dart';
import 'package:homepage/bottom_material/bottom_links.dart';
import 'package:homepage/material_custom.dart/google_map_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:number_paginator/number_paginator.dart';

import '../main.dart';

class Spa {
  final String name;
  final LatLng position;
  final String address;
  final String thumb;

  Spa(
      {required this.name,
      required this.address,
      required this.thumb,
      required this.position});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MapController mapController = MapController();
  final NumberPaginatorController _pageController = NumberPaginatorController();
  int itemClicked = -1;
  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  List<Spa> spas = [
    Spa(
        name: 'Store A',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(37.4219999, -122.0840575)),
    Spa(
        name: 'Store B',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(37.42796133580664, -122.085749655962)),
    Spa(
        name: 'Store C',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(37.422, -122.086)),
    Spa(
        name: 'Store D',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(37.423, -122.083)),
    Spa(
        name: 'Store E',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.604927, -0.351546)),
    Spa(
        name: 'Store F',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.581688, -0.405912)),
    Spa(
        name: 'Store G',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.581651, -0.429623)),
    Spa(
        name: 'Store H',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.569899, -0.432551)),
    Spa(
        name: 'Store J',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.567332, -0.381309)),
    Spa(
        name: 'Store K',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.576533, -0.455329)),
    Spa(
        name: 'Store Q',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.576533, -0.473329)),
    Spa(
        name: 'Store Z',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(51.559701, -0.365639)),
    Spa(
        name: 'Store W',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.349291, -101.715106)),
    Spa(
        name: 'Store X',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.347825, -101.717850)),
    Spa(
        name: 'Store Y',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.346284, -101.709417)),
    Spa(
        name: 'Store I',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.342422, -101.704701)),
    Spa(
        name: 'Store N',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.345430, -101.703015)),
    Spa(
        name: 'Store M',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.352639, -101.708545)),
    Spa(
        name: 'Store L',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.347258, -101.699405)),
    Spa(
        name: 'Store O',
        address: "City 0",
        thumb:
            "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy.",
        position: LatLng(39.3489868739043, -101.70366680462864)),
  ];
  Color _widgetColor = Color.fromARGB(255, 249, 249, 249);
  List<Spa> displayedSpas = [];
  int numberOfPages = 10;
  int currentPages = 0;
  @override
  void initState() {
    super.initState();
    displayedSpas.addAll(spas);
  }

  void searchMarkers(String query) {
    List<Spa> matchedMarkers = spas
        .where(
            (marker) => marker.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      if (query.isEmpty) {
        displayedSpas = spas;
      } else {
        displayedSpas = matchedMarkers;
      }
    });
  }

  void filterItems(String query) {
    setState(() {
      displayedSpas = spas
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void searchMarkers2(String query) {
    List<Spa> matchedMarkers = spas
        .where(
            (marker) => marker.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  void moveCameraToMarker(LatLng spa) {
    mapController.move(spa, 15.0);
  }

  void clearSearch() {
    _searchController.clear();
    searchMarkers('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void dispose2() {
    _scrollController.dispose();
    super.dispose();
  }

  void _changeColor() {
    setState(() {
      _widgetColor = _widgetColor == Color(0xffFFECEC)
          ? Color.fromARGB(255, 255, 255, 255)
          : Color(0xffFFECEC);
    });
  }

  void _scrollToIndex(int index) {
    setState(() {
      itemClicked = index;
    });
    final double itemExtent = 270; // Assuming each item has a height of 56.0
    final double offset = index * itemExtent;
    if (_scrollController.hasClients)
      _scrollController.animateTo(
        offset, // Assuming each item has a height of 56.0
        duration: Duration(milliseconds: 500),

        curve: Curves.easeInOut,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MyHomePage();
                      },
                    ));
                  },
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
                            controller: _searchController,
                            onTap: () {},
                            onChanged: (value) => searchMarkers(value),
                            onSubmitted: (value) {
                              String searchQuery = value.trim().toLowerCase();
                              Spa? matchedSpa = spas.firstWhereOrNull(
                                (spa) => spa.name
                                    .toLowerCase()
                                    .contains(searchQuery),
                              );
                              if (matchedSpa != null) {
                                moveCameraToMarker(matchedSpa.position);
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
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
                              onSubmitted: (value) {},
                              onChanged: (value) {},
                              onTap: () {},
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_pin),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
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
                      backgroundColor:
                          MaterialStateProperty.all(Color(0XFFD3427A)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(0)),
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
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(26)),
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
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(26)),
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
          ),
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
                color: const Color.fromARGB(255, 255, 254, 252),
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
                          Text("Over 222 Salons",
                              style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500))),
                          SizedBox(
                            width: 480,
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
                    Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: displayedSpas.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: InkWell(
                                  onTap: () {
                                    searchMarkers2(displayedSpas[index].name);
                                    moveCameraToMarker(
                                        displayedSpas[index].position);
                                    setState(() {
                                      if (itemClicked == index) {
                                        itemClicked = -1;
                                      } else {
                                        itemClicked = index;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: itemClicked == index
                                                ? Color(0xffD3427A)
                                                : Colors.transparent)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: itemClicked == index
                                              ? Color(0xffFFECEC)
                                              : Colors.transparent,
                                          border: Border(
                                              bottom: BorderSide(
                                            color: const Color(0xffEBEBEB),
                                          ))),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30),
                                                child: Container(
                                                  width: 250,
                                                  height: 270,
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
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      size: 30,
                                                      shadows: [
                                                        Shadow(
                                                            blurRadius: 300,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    251,
                                                                    251))
                                                      ],
                                                      Icons.favorite)),
                                            ],
                                          ),
                                          SizedBox(width: 5),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 50),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text.rich(TextSpan(children: [
                                                  WidgetSpan(
                                                      child: CircleAvatar(
                                                    child: CircleAvatar(
                                                      radius: 18,
                                                      backgroundImage:
                                                          AssetImage(
                                                              "images/avt1.png"),
                                                    ),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    radius: 20,
                                                  )),
                                                  WidgetSpan(
                                                      child: SizedBox(
                                                    width: 15,
                                                  )),
                                                  WidgetSpan(
                                                    child: Text(
                                                      displayedSpas[index].name,
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  )
                                                ])),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text.rich(TextSpan(children: [
                                                  WidgetSpan(
                                                    child: Icon(
                                                      Icons.grade,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                    child: Text(
                                                      "4.5 ",
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .bottom,
                                                    child: Text(
                                                      "(1200)",
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color: Color(
                                                                  0xff777777),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                      child: SizedBox(
                                                    width: 30,
                                                  )),
                                                  WidgetSpan(
                                                      child: Text(
                                                    "Open Now ",
                                                    style: GoogleFonts.mulish(
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xff007B2A),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  )),
                                                  WidgetSpan(
                                                    child: Text(
                                                      "- Closes 10 PM",
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color: Color(
                                                                  0xff777777),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  )
                                                ])),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text.rich(TextSpan(children: [
                                                  WidgetSpan(
                                                      child: Image(
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high,
                                                          fit: BoxFit.cover,
                                                          width: 20,
                                                          height: 20,
                                                          image: AssetImage(
                                                              "images/pin.png"))),
                                                  WidgetSpan(
                                                    child: Text(
                                                      displayedSpas[index]
                                                          .address,
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color: Color(
                                                                  0xff777777),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                      child: SizedBox(
                                                    width: 5,
                                                  )),
                                                  WidgetSpan(
                                                    child: Text(
                                                      "CA - ( ",
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color: Color(
                                                                  0xff777777),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                      child: SizedBox(
                                                    width: 5,
                                                  )),
                                                  WidgetSpan(
                                                      child: Image(
                                                          width: 20,
                                                          height: 20,
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high,
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              "images/distance.png"))),
                                                  WidgetSpan(
                                                    child: Text(
                                                      " 5 miles ",
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                    child: Text(
                                                      "drive )",
                                                      style: GoogleFonts.mulish(
                                                          textStyle: TextStyle(
                                                              color: Color(
                                                                  0xff777777),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  )
                                                ])),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  displayedSpas[index].thumb,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff777777)),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                      elevation:
                                                          MaterialStateProperty
                                                              .all(0),
                                                      fixedSize:
                                                          MaterialStateProperty
                                                              .all(Size(
                                                                  130, 40)),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0)),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text.rich(
                                                      TextSpan(children: [
                                                        TextSpan(
                                                            text: "Book Now",
                                                            style: GoogleFonts.mulish(
                                                                textStyle: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    fontSize:
                                                                        18))),
                                                      ]),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              );
                            })),
                    NumberPaginator(
                      controller: _pageController,
                      config: NumberPaginatorUIConfig(),
                      numberPages: numberOfPages,
                      onPageChange: (index) {
                        setState(() {});
                      },
                    )
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
                      width: 750,
                      height: 1000,
                      child: FlutterMap(
                        options: MapOptions(
                          enableScrollWheel: true,
                          center: LatLng(
                              51.587281, -0.399254), // Initial map center
                          zoom: 12.0,
                        ),
                        mapController: mapController,
                        children: [
                          TileLayer(
                              urlTemplate:
                                  'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                              maxZoom: 20,
                              subdomains: ['mt0', 'mt1', 'mt2', 'mt3']),
                          MarkerLayer(
                            markers: displayedSpas.map((spaData) {
                              final int index = displayedSpas.indexOf(spaData);
                              return Marker(
                                point: spaData.position,
                                builder: (ctx) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (itemClicked == index) {
                                        itemClicked = -1;
                                      } else {
                                        itemClicked = index;
                                      }
                                    });
                                    _scrollToIndex(index);

                                    moveCameraToMarker(spaData.position);
                                  },
                                  onHover: (value) {},
                                  child: Image(
                                      fit: BoxFit.contain,
                                      image: AssetImage("images/marker.png")),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ))
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

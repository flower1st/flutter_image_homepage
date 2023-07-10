// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last, unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/bottom_material/bottom_links.dart';
import 'package:homepage/material_custom.dart/google_map_api.dart';
import 'package:latlong2/latlong.dart';

class MarkerData {
  final String name;
  final LatLng position;

  MarkerData({required this.name, required this.position});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MapController mapController = MapController();

  List<MarkerData> allMarkers = [
    MarkerData(name: 'Marker 1', position: LatLng(37.4219999, -122.0840575)),
    MarkerData(
        name: 'Marker 2',
        position: LatLng(37.42796133580664, -122.085749655962)),
    MarkerData(name: 'Marker 3', position: LatLng(37.422, -122.086)),
    MarkerData(name: 'Marker 4', position: LatLng(37.423, -122.083)),
  ];

  List<MarkerData> displayedMarkers = [];

  @override
  void initState() {
    super.initState();
    displayedMarkers = allMarkers;
  }

  void searchMarkers(String query) {
    setState(() {
      displayedMarkers = allMarkers
          .where((marker) =>
              marker.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  List designations = List.generate(
      30,
      (index) =>
          ("Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy."));

  List names = List.generate(30, (index) => ("Spa Number: $index"));
  List spanames =
      List.generate(30, (index) => ("Hazard Ave Westminster, CA - ("));

  openOrClose(bool result) {
    Random random = Random();
    result = random.nextDouble() <= 0.7;
  }

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
              ListUser(
                  names: names, spanames: spanames, designations: designations),
              SizedBox(
                width: 20,
              ),
              Positioned(
                left: 1090,
                child: Column(
                  children: [
                    Container(
                        child: Container(
                            width: 750, height: 1000, child: MapApi()))
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

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
                        onSubmitted: (value) {},
                        onChanged: (value) {},
                        onTap: () {},
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

class ListUser extends StatelessWidget {
  const ListUser({
    super.key,
    required this.names,
    required this.spanames,
    required this.designations,
  });

  final List names;
  final List spanames;
  final List designations;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            fontSize: 25, fontWeight: FontWeight.w500))),
                SizedBox(
                  width: 480,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      fixedSize: MaterialStateProperty.all(Size(170, 50)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(width: 2, color: Color(0XFFCDCDCD)),
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
                      fixedSize: MaterialStateProperty.all(Size(170, 50)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(width: 2, color: Color(0XFFCDCDCD)),
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
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20))),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                                color: Color.fromARGB(212, 14, 14, 11),
                                size: 25,
                                Icons.arrow_drop_down)),
                      ]),
                    )),
              ],
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: names.length - 25,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    decoration: BoxDecoration(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Container(
                                    width: 250,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://nationaltoday.com/wp-content/uploads/2021/12/Festival-of-Owls-Week-1200x834.jpg")),
                                      color: Color.fromARGB(255, 55, 18, 164),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    child: Icon(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        size: 30,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 300,
                                              color: Color.fromARGB(
                                                  255, 255, 251, 251))
                                        ],
                                        Icons.favorite)),
                              ],
                            ),
                            SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.only(right: 180),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                        child: CircleAvatar(
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundImage:
                                            AssetImage("images/avt1.png"),
                                      ),
                                      backgroundColor: Colors.grey,
                                      radius: 20,
                                    )),
                                    WidgetSpan(
                                        child: SizedBox(
                                      width: 15,
                                    )),
                                    WidgetSpan(
                                      child: Text(
                                        names[index],
                                        style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600)),
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
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.bottom,
                                      child: Text(
                                        "(1200)",
                                        style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
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
                                              color: Color(0xff007B2A),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    )),
                                    WidgetSpan(
                                      child: Text(
                                        "- Closes 10 PM",
                                        style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    )
                                  ])),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                        child: Image(
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.cover,
                                            width: 20,
                                            height: 20,
                                            image:
                                                AssetImage("images/pin.png"))),
                                    WidgetSpan(
                                      child: Text(
                                        spanames[index],
                                        style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
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
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "images/distance.png"))),
                                    WidgetSpan(
                                      child: Text(
                                        " 5 miles ",
                                        style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Text(
                                        "drive )",
                                        style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    )
                                  ])),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    designations[index],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        fixedSize: MaterialStateProperty.all(
                                            Size(130, 40)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
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
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 18))),
                                        ]),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}

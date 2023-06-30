// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/material_custom.dart/gridview_image.dart';

class CustomMiniBox extends StatefulWidget {
  @override
  State<CustomMiniBox> createState() => _CustomMiniBox();
}

class _CustomMiniBox extends State<CustomMiniBox> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(1000, 20, 20, 20),
      sliver: SliverAppBar(
          elevation: 0,
          floating: false,
          pinned: true,
          stretch: true,
          title: Container(
            width: 500,
            height: 500,
            child: Text('Sliver App Bar with Row'),
          ),
          backgroundColor: Colors.amber,
          expandedHeight: 500,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.fromLTRB(200, 500, 500, 200),
          )),
    );
  }
}

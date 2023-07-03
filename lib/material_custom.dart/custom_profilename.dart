// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String name;
  ProfileImage({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(name),
            fit: BoxFit.cover),
      ),
    );
  }
}

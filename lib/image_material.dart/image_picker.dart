// ignore_for_file: avoid_print, sized_box_for_whitespace, unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: ImageUploader()));
}

class ImageUploader extends StatefulWidget {
  @override
  State<ImageUploader> createState() => _ImageUploader();
}

class _ImageUploader extends State<ImageUploader> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  clearimage() {
    setState(() {
      imagefiles = null;
    });
  }

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        child: Row(
          children: [
            //open button ----------------
            imagefiles != null
                ? Wrap(
                    children: imagefiles!.map((imageone) {
                      return Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(),
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                      fit: BoxFit.cover, File(imageone.path)))),
                          Positioned(
                              right: 1,
                              child: IconButton(
                                  onPressed: () {
                                    clearimage();
                                  },
                                  icon: Icon(Icons.cancel_rounded))),
                        ],
                      );
                    }).toList(),
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              dashPattern: [8, 4],
              color: Color.fromARGB(255, 196, 16, 88),
              child: ElevatedButton(
                  onPressed: () {
                    openImages();
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                    fixedSize: MaterialStateProperty.all(Size(150, 150)),
                    side: MaterialStateProperty.all(
                        BorderSide(width: 2, color: Colors.transparent)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0XFFFFECEC)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(children: [
                      WidgetSpan(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Image(
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            image: AssetImage("images/pinkcloud.png")),
                      )),
                      WidgetSpan(
                        child: Text(
                          maxLines: 3,
                          "Upload Photo /Videos",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF777777),
                                  fontSize: 20)),
                        ),
                      ),
                    ]),
                  )),
            ),
          ],
        ));
  }
}

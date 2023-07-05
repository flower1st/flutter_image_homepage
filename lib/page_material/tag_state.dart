// ignore_for_file: unnecessary_string_interpolations, avoid_print, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/image_material.dart/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    );
  }
}

class TagState extends StatefulWidget {
  const TagState({Key? key}) : super(key: key);

  @override
  State<TagState> createState() => _TagState();
}

class _TagState extends State<TagState> {
  double _distanceToField = 0;
  TextfieldTagsController _controller = new TextfieldTagsController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          TextFieldTags(
            textfieldTagsController: _controller,
            initialTags: const [
              'Tech Name 1',
              'Tech Name 2',
              'Services 1',
              'Services 2',
            ],
            textSeparators: const ['', ','],
            letterCase: LetterCase.normal,
            validator: (String tag) {
              if (_controller.getTags!.contains(tag)) {
                return 'you already entered that';
              }
              return null;
            },
            inputfieldBuilder:
                (context, tec, fn, error, onChanged, onSubmitted) {
              return ((context, sc, tags, onTagDelete) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: tec,
                    focusNode: fn,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: false,
                      hintText: _controller.hasTags ? '' : "Enter tag...",
                      errorText: error,
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: _distanceToField * 3),
                      prefixIcon: tags.isNotEmpty
                          ? SingleChildScrollView(
                              controller: sc,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: tags.map((String tag) {
                                return Container(
                                  width: 180,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Color(0XFFCDCDCD)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(300.0),
                                    ),
                                    color: Color(0XFFEBEBEB),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Text('$tag',
                                            style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            )),
                                        onTap: () {
                                          print("$tag selected");
                                        },
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        child: const Icon(
                                          Icons.close,
                                          size: 21.0,
                                          color: Color.fromARGB(255, 3, 0, 0),
                                        ),
                                        onTap: () {
                                          onTagDelete(tag);
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }).toList()),
                            )
                          : null,
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

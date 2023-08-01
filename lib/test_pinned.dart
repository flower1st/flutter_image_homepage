import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Slow Scrolling Up Example'),
        ),
        body: SlowScrollingWidget(),
      ),
    );
  }
}

class SlowScrollingWidget extends StatefulWidget {
  @override
  _SlowScrollingWidgetState createState() => _SlowScrollingWidgetState();
}

class _SlowScrollingWidgetState extends State<SlowScrollingWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Check if the scroll position is close to the top
    if (_scrollController.position.pixels <= 50.0) {
      _scrollUpSlowly();
    }
  }

  void _scrollUpSlowly() async {
    while (_scrollController.position.pixels > 0) {
      await Future.delayed(Duration(
          milliseconds:
              50)); // Adjust the delay as needed for the scrolling speed
      _scrollController.jumpTo(_scrollController.position.pixels -
          1); // Adjust the offset change to control the scrolling speed
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          // Reset the scroll position when scrolling starts
          _scrollController.jumpTo(_scrollController.position.pixels);
        }
        return false;
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(title: Text('List Item ${index + 1}'));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WidgetData {
  final String name;
  final Widget widget;

  WidgetData({required this.name, required this.widget});
}

class WidgetScreen extends StatefulWidget {
  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  List<WidgetData> allWidgets = [
    WidgetData(
      name: 'Widget 1',
      widget: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    ),
    WidgetData(
      name: 'Widget 2',
      widget: Container(
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
    ),
    WidgetData(
      name: 'Widget 3',
      widget: Container(
        color: Colors.green,
        width: 100,
        height: 100,
      ),
    ),
    WidgetData(
      name: 'Widget 4',
      widget: Container(
        color: Colors.yellow,
        width: 100,
        height: 100,
      ),
    ),
  ];

  List<WidgetData> displayedWidgets = [];

  @override
  void initState() {
    super.initState();
    displayedWidgets = List.from(allWidgets);
  }

  void searchWidgets(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedWidgets = List.from(allWidgets);
      });
    } else {
      setState(() {
        displayedWidgets = allWidgets
            .where((widgetData) =>
                widgetData.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: searchWidgets,
              decoration: InputDecoration(
                labelText: 'Search by Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedWidgets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(displayedWidgets[index].name),
                  subtitle: displayedWidgets[index].widget,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

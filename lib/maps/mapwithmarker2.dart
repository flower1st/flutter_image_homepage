import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class MarkerData {
  final String name;
  final LatLng position;

  MarkerData({required this.name, required this.position});
}

class MapScreen2 extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen2> {
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

  void searchMarker(String query) {
    setState(() {
      displayedMarkers = allMarkers
          .where((marker) =>
              marker.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(37.4219999, -122.0840575), // Initial map center
          zoom: 12.0,
        ),
        mapController: mapController,
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: displayedMarkers
                .map((marker) => Marker(
                      point: marker.position,
                      builder: (ctx) => Icon(Icons.location_on),
                    ))
                .toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to enter the marker name to search
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Search Marker'),
                content: TextField(
                  onChanged: (value) => searchMarker(value),
                  decoration: InputDecoration(hintText: 'Enter marker name'),
                ),
                actions: [
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.search),
      ),
    );
  }
}

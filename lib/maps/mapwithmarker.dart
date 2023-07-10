import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class MarkerData {
  final String name;
  final LatLng position;

  MarkerData({required this.name, required this.position});
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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

  void moveCameraToMarker(LatLng position) {
    mapController.move(position, 15.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(37.4219999, -122.0840575), // Initial map center
              zoom: 12.0,
            ),
            mapController: mapController,
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: displayedMarkers.map((markerData) {
                  return Marker(
                    point: markerData.position,
                    builder: (ctx) => Icon(Icons.location_on),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (value) {
              searchMarker(value);
            },
            decoration: InputDecoration(
              labelText: 'Search Marker',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}

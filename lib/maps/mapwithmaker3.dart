import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class MapScreen3 extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen3> {
  MapController mapController = MapController();

  List<MarkerData> markers = [
    MarkerData(name: 'Marker 1', position: LatLng(37.4219999, -122.0840575)),
    MarkerData(
        name: 'Marker 2',
        position: LatLng(37.42796133580664, -122.085749655962)),
  ];

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
          onTap: (tapPosition, point) {
            moveCamera(point);
          },
        ),
        mapController: mapController,
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: markers
                .map(
                  (marker) => Marker(
                    point: marker.position,
                    builder: (ctx) => GestureDetector(
                      onTap: () {
                        // Move the camera when the marker widget is clicked
                        moveCamera(marker.position);
                      },
                      child: Icon(Icons.location_on),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void moveCamera(LatLng position) {
    mapController.move(position, 12.0);
  }
}

class MarkerData {
  final String name;
  final LatLng position;

  MarkerData({required this.name, required this.position});
}

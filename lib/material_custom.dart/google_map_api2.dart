// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MarkerData {
  final String name;
  final LatLng position;

  MarkerData({required this.name, required this.position});
}

class MapApi2 extends StatefulWidget {
  @override
  _MapApi2 createState() => _MapApi2();
}

class _MapApi2 extends State<MapApi2> {
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
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
            ],
          ),
        ),
      ],
    );
  }
}

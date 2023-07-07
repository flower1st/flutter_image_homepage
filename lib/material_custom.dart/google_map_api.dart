// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

@override
Widget onMap(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      center: LatLng(51.509364, -0.128928),
      zoom: 9.2,
    ),
    nonRotatedChildren: [
      RichAttributionWidget(
        attributions: [
          TextSourceAttribution(
            'OpenStreetMap contributors',
            onTap: () =>
                launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          ),
        ],
      ),
    ],
    children: [
      TileLayer(
        urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
        userAgentPackageName: 'com.example.app',
        maxZoom: 20,
        subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
      ),
    ],
  );
}

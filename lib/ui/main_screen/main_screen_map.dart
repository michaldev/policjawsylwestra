import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MainScreenMap extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: new MapOptions(
        center: new LatLng(52.229676, 21.012229),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 30.0,
              height: 30.0,
              point: new LatLng(52.229676, 21.012229),
              builder: (ctx) =>
                  new Container(child: new Image.asset('assets/policeman.png')),
            ),
          ],
        ),
      ],
    );
  }
}

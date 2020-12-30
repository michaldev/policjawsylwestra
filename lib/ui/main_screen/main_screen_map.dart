import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:policjawsylwestra/domain/data_repository.dart';

class MainScreenMap extends HookWidget {
  final LatLng location;
  final List<PolicePoint> policePoints;

  MainScreenMap({@required this.location, @required this.policePoints});

  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[];

    for (final policePoint in policePoints) {
      markers.add(Marker(
        width: 30.0,
        height: 30.0,
        point: policePoint.position,
        builder: (ctx) =>
            new Container(child: new Image.asset('assets/policeman.png')),
      ));
    }

    return FlutterMap(
      options: new MapOptions(
        center: location,
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }
}

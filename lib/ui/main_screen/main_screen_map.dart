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
    final mapController = useMemoized(() => MapController());

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

    markers.add(Marker(
        width: 25.0,
        height: 25.0,
        point: location,
        builder: (ctx) => Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            )));

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: location,
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }
}

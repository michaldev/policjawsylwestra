import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:policjawsylwestra/ui/report_screen/store/report_store.dart';
import 'package:flutter_map/flutter_map.dart';

class ReportScreen extends HookWidget {
  final LatLng location;

  ReportScreen(this.location);

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => ReportStore());

    useMemoized(() {
      reaction((_) => store.reportState == ReportState.success, (success) {
        Navigator.pop(context);
      });
    });

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Zgłoś patrol'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => store.report(location),
          child: Icon(Icons.check),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: FlutterMap(
                  options: MapOptions(
                    center: location,
                    zoom: 13.0,
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                            width: 50.0,
                            height: 50.0,
                            point: location,
                            builder: (ctx) => Container(
                                  child: Icon(Icons.map_rounded),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                ))
                      ],
                    ),
                  ],
                )),
              ],
            ),
            if (store.reportState == ReportState.sending)
              LinearProgressIndicator()
          ],
        ),
      );
    });
  }
}

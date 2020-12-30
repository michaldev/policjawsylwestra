import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:policjawsylwestra/domain/data_repository.dart';
import 'package:policjawsylwestra/ui/info_screen/info_screen.dart';
import 'package:policjawsylwestra/ui/main_screen/main_screen_map.dart';
import 'package:policjawsylwestra/ui/main_screen/main_screen_report_button.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final location = useState<LatLng>();

    useMemoized(() {
      Location().getLocation().then((value) {
        location.value = LatLng(value.latitude, value.longitude);
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Policja w pobliżu'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => InfoScreen())),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.info),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          onPressed: () async {
            //test
            await GetIt.I
                .get<DataRepository>()
                .getNearestPolice(LatLng(9, 0), 20);

            // Location().getLocation().then((value) {
            //   location.value = LatLng(value.latitude, value.longitude);
            // });
          },
          child: Icon(Icons.refresh),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MainScreenMap(
              location: location.value,
            ),
          ),
          MainScreenReportButton(onTap: () {
            GetIt.I
                .get<DataRepository>()
                .addPoint(location.value, PoliceType.foot);
          })
        ],
      ),
    );
  }
}

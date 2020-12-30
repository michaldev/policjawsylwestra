import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:policjawsylwestra/domain/data_repository.dart';
import 'package:policjawsylwestra/ui/info_screen/info_screen.dart';
import 'package:policjawsylwestra/ui/main_screen/main_screen_map.dart';
import 'package:policjawsylwestra/ui/main_screen/main_screen_report_button.dart';
import 'package:policjawsylwestra/ui/report_screen/report_screen.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final location = useState<LatLng>();
    final dataRepository = GetIt.I.get<DataRepository>();

    useMemoized(() {
      Location().getLocation().then((value) {
        location.value = LatLng(value.latitude, value.longitude);
        dataRepository.getNearestPolice(location.value, 80);
      });
      Location().onLocationChanged.listen((event) {
        location.value = LatLng(event.latitude, event.longitude);
        dataRepository.getNearestPolice(location.value, 80);
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<PolicePoint>>(
                stream: GetIt.I.get<DataRepository>().policePointsStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return MainScreenMap(
                      location: location.value,
                      policePoints: snapshot.data,
                    );
                  }
                  return CupertinoActivityIndicator();
                }),
          ),
          MainScreenReportButton(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportScreen(location.value)))),
        ],
      ),
    );
  }
}

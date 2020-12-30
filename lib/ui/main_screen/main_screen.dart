import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:policjawsylwestra/domain/data_repository.dart';
import 'package:policjawsylwestra/ui/main_screen/main_screen_map.dart';

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          onPressed: () async {
            //test
            final points = await GetIt.I
                .get<DataRepository>()
                .getNearestPolice(LatLng(9, 0));
            print(points);

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
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.red,
              child: Center(
                  child: Text(
                'Zgłoś lokalizację policji'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )))
        ],
      ),
    );
  }
}

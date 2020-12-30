import 'package:flutter/foundation.dart';
import 'package:latlong/latlong.dart';

enum PoliceType { car, home, foot }

class PolicePoint {
  LatLng position;
  PoliceType policeType;

  PolicePoint({@required this.position, @required this.policeType});
}

abstract class DataRepository {
  Future<List<PolicePoint>> getNearestPolice(LatLng position);
}

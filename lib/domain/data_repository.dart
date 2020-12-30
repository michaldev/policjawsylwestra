import 'package:flutter/foundation.dart';
import 'package:latlong/latlong.dart';

enum PoliceType { car, home, foot }

class PolicePoint {
  LatLng position;
  PoliceType policeType;

  PolicePoint({@required this.position, @required this.policeType});
}

abstract class DataRepository {
  Future<void> getNearestPolice(LatLng position, double radius);
  Future<void> addPoint(LatLng position, PoliceType policeType);
}

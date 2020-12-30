import 'package:latlong/latlong.dart';

class PolicePoint {
  LatLng position;
}

abstract class DataRepository {
  Future<List<PolicePoint>> getNearestPolice(LatLng position);
}

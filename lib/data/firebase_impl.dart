import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latlong/latlong.dart';
import 'package:policjawsylwestra/domain/data_repository.dart';

class FirebaseImpl extends DataRepository {
  FirebaseImpl() {
    Firebase.initializeApp();
  }
  @override
  Future<List<PolicePoint>> getNearestPolice(LatLng position) async {
    final pointsRequest =
        await FirebaseFirestore.instance.collection('points').get();
    return pointsRequest.docs.map((e) {
      final geopoint = (e.data()['position'] as GeoPoint);
      return PolicePoint(
          position: LatLng(geopoint.latitude, geopoint.longitude),
          policeType: e.data()['point']);
    }).toList();
  }
}

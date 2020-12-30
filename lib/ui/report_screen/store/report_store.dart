import 'package:get_it/get_it.dart';
import 'package:latlong/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:policjawsylwestra/domain/data_repository.dart';
part 'report_store.g.dart';

class ReportStore = _ReportStoreBase with _$ReportStore;

enum ReportState { initial, sending, success, error }

abstract class _ReportStoreBase with Store {
  @observable
  ReportState reportState = ReportState.initial;

  @observable
  PoliceType policeType;

  @action
  Future<void> report(LatLng location) async {
    reportState = ReportState.sending;

    try {
      await GetIt.I.get<DataRepository>().addPoint(location, null);
      reportState = ReportState.success;
    } catch (e) {
      reportState = ReportState.error;
    }
  }
}

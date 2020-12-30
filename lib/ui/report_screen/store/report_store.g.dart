// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportStore on _ReportStoreBase, Store {
  final _$reportStateAtom = Atom(name: '_ReportStoreBase.reportState');

  @override
  ReportState get reportState {
    _$reportStateAtom.reportRead();
    return super.reportState;
  }

  @override
  set reportState(ReportState value) {
    _$reportStateAtom.reportWrite(value, super.reportState, () {
      super.reportState = value;
    });
  }

  final _$policeTypeAtom = Atom(name: '_ReportStoreBase.policeType');

  @override
  PoliceType get policeType {
    _$policeTypeAtom.reportRead();
    return super.policeType;
  }

  @override
  set policeType(PoliceType value) {
    _$policeTypeAtom.reportWrite(value, super.policeType, () {
      super.policeType = value;
    });
  }

  final _$reportAsyncAction = AsyncAction('_ReportStoreBase.report');

  @override
  Future<void> report(LatLng location) {
    return _$reportAsyncAction.run(() => super.report(location));
  }

  @override
  String toString() {
    return '''
reportState: ${reportState},
policeType: ${policeType}
    ''';
  }
}

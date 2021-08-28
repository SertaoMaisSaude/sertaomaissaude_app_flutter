// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_centers_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HealthCentersController on _HealthCentersControllerBase, Store {
  final _$districtSelectedAtom =
      Atom(name: '_HealthCentersControllerBase.districtSelected');

  @override
  String get districtSelected {
    _$districtSelectedAtom.context.enforceReadPolicy(_$districtSelectedAtom);
    _$districtSelectedAtom.reportObserved();
    return super.districtSelected;
  }

  @override
  set districtSelected(String value) {
    _$districtSelectedAtom.context.conditionallyRunInAction(() {
      super.districtSelected = value;
      _$districtSelectedAtom.reportChanged();
    }, _$districtSelectedAtom, name: '${_$districtSelectedAtom.name}_set');
  }

  final _$centersAtom = Atom(name: '_HealthCentersControllerBase.centers');

  @override
  List<HealthCenterModel> get centers {
    _$centersAtom.context.enforceReadPolicy(_$centersAtom);
    _$centersAtom.reportObserved();
    return super.centers;
  }

  @override
  set centers(List<HealthCenterModel> value) {
    _$centersAtom.context.conditionallyRunInAction(() {
      super.centers = value;
      _$centersAtom.reportChanged();
    }, _$centersAtom, name: '${_$centersAtom.name}_set');
  }

  final _$centersfiltredAtom =
      Atom(name: '_HealthCentersControllerBase.centersfiltred');

  @override
  List<HealthCenterModel> get centersfiltred {
    _$centersfiltredAtom.context.enforceReadPolicy(_$centersfiltredAtom);
    _$centersfiltredAtom.reportObserved();
    return super.centersfiltred;
  }

  @override
  set centersfiltred(List<HealthCenterModel> value) {
    _$centersfiltredAtom.context.conditionallyRunInAction(() {
      super.centersfiltred = value;
      _$centersfiltredAtom.reportChanged();
    }, _$centersfiltredAtom, name: '${_$centersfiltredAtom.name}_set');
  }

  final _$neighborhoodsAtom =
      Atom(name: '_HealthCentersControllerBase.neighborhoods');

  @override
  Set<String> get neighborhoods {
    _$neighborhoodsAtom.context.enforceReadPolicy(_$neighborhoodsAtom);
    _$neighborhoodsAtom.reportObserved();
    return super.neighborhoods;
  }

  @override
  set neighborhoods(Set<String> value) {
    _$neighborhoodsAtom.context.conditionallyRunInAction(() {
      super.neighborhoods = value;
      _$neighborhoodsAtom.reportChanged();
    }, _$neighborhoodsAtom, name: '${_$neighborhoodsAtom.name}_set');
  }

  final _$dropDownValueAtom =
      Atom(name: '_HealthCentersControllerBase.dropDownValue');

  @override
  String get dropDownValue {
    _$dropDownValueAtom.context.enforceReadPolicy(_$dropDownValueAtom);
    _$dropDownValueAtom.reportObserved();
    return super.dropDownValue;
  }

  @override
  set dropDownValue(String value) {
    _$dropDownValueAtom.context.conditionallyRunInAction(() {
      super.dropDownValue = value;
      _$dropDownValueAtom.reportChanged();
    }, _$dropDownValueAtom, name: '${_$dropDownValueAtom.name}_set');
  }

  final _$_HealthCentersControllerBaseActionController =
      ActionController(name: '_HealthCentersControllerBase');

  @override
  void searchCenter(String value) {
    final _$actionInfo =
        _$_HealthCentersControllerBaseActionController.startAction();
    try {
      return super.searchCenter(value);
    } finally {
      _$_HealthCentersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'districtSelected: ${districtSelected.toString()},centers: ${centers.toString()},centersfiltred: ${centersfiltred.toString()},neighborhoods: ${neighborhoods.toString()},dropDownValue: ${dropDownValue.toString()}';
    return '{$string}';
  }
}

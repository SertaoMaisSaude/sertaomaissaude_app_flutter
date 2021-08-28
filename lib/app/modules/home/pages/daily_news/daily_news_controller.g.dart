// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_news_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DailyNewsController on _DailyNewsControllerBase, Store {
  Computed<BoletimLineModel> _$confirmedComputed;

  @override
  BoletimLineModel get confirmed => (_$confirmedComputed ??=
          Computed<BoletimLineModel>(() => super.confirmed))
      .value;
  Computed<BoletimLineModel> _$deathsComputed;

  @override
  BoletimLineModel get deaths =>
      (_$deathsComputed ??= Computed<BoletimLineModel>(() => super.deaths))
          .value;
  Computed<BoletimLineModel> _$discardedComputed;

  @override
  BoletimLineModel get discarded => (_$discardedComputed ??=
          Computed<BoletimLineModel>(() => super.discarded))
      .value;
  Computed<BoletimLineModel> _$recoveredComputed;

  @override
  BoletimLineModel get recovered => (_$recoveredComputed ??=
          Computed<BoletimLineModel>(() => super.recovered))
      .value;
  Computed<BoletimLineModel> _$underInvestigationComputed;

  @override
  BoletimLineModel get underInvestigation => (_$underInvestigationComputed ??=
          Computed<BoletimLineModel>(() => super.underInvestigation))
      .value;
  Computed<BoletimLineModel> _$waitingExamComputed;

  @override
  BoletimLineModel get waitingExam => (_$waitingExamComputed ??=
          Computed<BoletimLineModel>(() => super.waitingExam))
      .value;
  Computed<BoletimLineModel> _$homeIsolationComputed;

  @override
  BoletimLineModel get homeIsolation => (_$homeIsolationComputed ??=
          Computed<BoletimLineModel>(() => super.homeIsolation))
      .value;
  Computed<BoletimLineModel> _$hospitalStayComputed;

  @override
  BoletimLineModel get hospitalStay => (_$hospitalStayComputed ??=
          Computed<BoletimLineModel>(() => super.hospitalStay))
      .value;
  Computed<BoletimLineModel> _$testsCountyComputed;

  @override
  BoletimLineModel get testsCounty => (_$testsCountyComputed ??=
          Computed<BoletimLineModel>(() => super.testsCounty))
      .value;
  Computed<BoletimLineModel> _$testsLacenComputed;

  @override
  BoletimLineModel get testsLacen => (_$testsLacenComputed ??=
          Computed<BoletimLineModel>(() => super.testsLacen))
      .value;
  Computed<BoletimLineModel> _$testsPrivateComputed;

  @override
  BoletimLineModel get testsPrivate => (_$testsPrivateComputed ??=
          Computed<BoletimLineModel>(() => super.testsPrivate))
      .value;

  final _$boletinsAtom = Atom(name: '_DailyNewsControllerBase.boletins');

  @override
  List<DailyNewsModel> get boletins {
    _$boletinsAtom.context.enforceReadPolicy(_$boletinsAtom);
    _$boletinsAtom.reportObserved();
    return super.boletins;
  }

  @override
  set boletins(List<DailyNewsModel> value) {
    _$boletinsAtom.context.conditionallyRunInAction(() {
      super.boletins = value;
      _$boletinsAtom.reportChanged();
    }, _$boletinsAtom, name: '${_$boletinsAtom.name}_set');
  }

  final _$boletimSelectedAtom =
      Atom(name: '_DailyNewsControllerBase.boletimSelected');

  @override
  BoletimLineModel get boletimSelected {
    _$boletimSelectedAtom.context.enforceReadPolicy(_$boletimSelectedAtom);
    _$boletimSelectedAtom.reportObserved();
    return super.boletimSelected;
  }

  @override
  set boletimSelected(BoletimLineModel value) {
    _$boletimSelectedAtom.context.conditionallyRunInAction(() {
      super.boletimSelected = value;
      _$boletimSelectedAtom.reportChanged();
    }, _$boletimSelectedAtom, name: '${_$boletimSelectedAtom.name}_set');
  }

  final _$_DailyNewsControllerBaseActionController =
      ActionController(name: '_DailyNewsControllerBase');

  @override
  void changeBoletimSelected(BoletimLineModel model) {
    final _$actionInfo =
        _$_DailyNewsControllerBaseActionController.startAction();
    try {
      return super.changeBoletimSelected(model);
    } finally {
      _$_DailyNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'boletins: ${boletins.toString()},boletimSelected: ${boletimSelected.toString()},confirmed: ${confirmed.toString()},deaths: ${deaths.toString()},discarded: ${discarded.toString()},recovered: ${recovered.toString()},underInvestigation: ${underInvestigation.toString()},waitingExam: ${waitingExam.toString()},homeIsolation: ${homeIsolation.toString()},hospitalStay: ${hospitalStay.toString()},testsCounty: ${testsCounty.toString()},testsLacen: ${testsLacen.toString()},testsPrivate: ${testsPrivate.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analisy_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnalisyController on _AnalisyControllerBase, Store {
  Computed<String> _$validateNameComputed;

  @override
  String get validateName =>
      (_$validateNameComputed ??= Computed<String>(() => super.validateName))
          .value;
  Computed<String> _$validateAgeComputed;

  @override
  String get validateAge =>
      (_$validateAgeComputed ??= Computed<String>(() => super.validateAge))
          .value;
  Computed<String> _$validateCepComputed;

  @override
  String get validateCep =>
      (_$validateCepComputed ??= Computed<String>(() => super.validateCep))
          .value;
  Computed<String> _$validateNeighborhoodComputed;

  @override
  String get validateNeighborhood => (_$validateNeighborhoodComputed ??=
          Computed<String>(() => super.validateNeighborhood))
      .value;
  Computed<String> _$validateFeverComputed;

  @override
  String get validateFever =>
      (_$validateFeverComputed ??= Computed<String>(() => super.validateFever))
          .value;
  Computed<String> _$validatePhoneComputed;

  @override
  String get validatePhone =>
      (_$validatePhoneComputed ??= Computed<String>(() => super.validatePhone))
          .value;

  final _$pageStatusAtom = Atom(name: '_AnalisyControllerBase.pageStatus');

  @override
  AnalisyStatus get pageStatus {
    _$pageStatusAtom.context.enforceReadPolicy(_$pageStatusAtom);
    _$pageStatusAtom.reportObserved();
    return super.pageStatus;
  }

  @override
  set pageStatus(AnalisyStatus value) {
    _$pageStatusAtom.context.conditionallyRunInAction(() {
      super.pageStatus = value;
      _$pageStatusAtom.reportChanged();
    }, _$pageStatusAtom, name: '${_$pageStatusAtom.name}_set');
  }

  final _$symptonsAtom = Atom(name: '_AnalisyControllerBase.symptons');

  @override
  List<SymptonModel> get symptons {
    _$symptonsAtom.context.enforceReadPolicy(_$symptonsAtom);
    _$symptonsAtom.reportObserved();
    return super.symptons;
  }

  @override
  set symptons(List<SymptonModel> value) {
    _$symptonsAtom.context.conditionallyRunInAction(() {
      super.symptons = value;
      _$symptonsAtom.reportChanged();
    }, _$symptonsAtom, name: '${_$symptonsAtom.name}_set');
  }

  final _$contactsAtom = Atom(name: '_AnalisyControllerBase.contacts');

  @override
  List<CovidContactModel> get contacts {
    _$contactsAtom.context.enforceReadPolicy(_$contactsAtom);
    _$contactsAtom.reportObserved();
    return super.contacts;
  }

  @override
  set contacts(List<CovidContactModel> value) {
    _$contactsAtom.context.conditionallyRunInAction(() {
      super.contacts = value;
      _$contactsAtom.reportChanged();
    }, _$contactsAtom, name: '${_$contactsAtom.name}_set');
  }

  final _$citizenSymptonsAtom =
      Atom(name: '_AnalisyControllerBase.citizenSymptons');

  @override
  ObservableList<SymptonModel> get citizenSymptons {
    _$citizenSymptonsAtom.context.enforceReadPolicy(_$citizenSymptonsAtom);
    _$citizenSymptonsAtom.reportObserved();
    return super.citizenSymptons;
  }

  @override
  set citizenSymptons(ObservableList<SymptonModel> value) {
    _$citizenSymptonsAtom.context.conditionallyRunInAction(() {
      super.citizenSymptons = value;
      _$citizenSymptonsAtom.reportChanged();
    }, _$citizenSymptonsAtom, name: '${_$citizenSymptonsAtom.name}_set');
  }

  final _$riskGroupsAtom = Atom(name: '_AnalisyControllerBase.riskGroups');

  @override
  List<RiskGroupModel> get riskGroups {
    _$riskGroupsAtom.context.enforceReadPolicy(_$riskGroupsAtom);
    _$riskGroupsAtom.reportObserved();
    return super.riskGroups;
  }

  @override
  set riskGroups(List<RiskGroupModel> value) {
    _$riskGroupsAtom.context.conditionallyRunInAction(() {
      super.riskGroups = value;
      _$riskGroupsAtom.reportChanged();
    }, _$riskGroupsAtom, name: '${_$riskGroupsAtom.name}_set');
  }

  final _$citizenRiskGroupsAtom =
      Atom(name: '_AnalisyControllerBase.citizenRiskGroups');

  @override
  ObservableList<RiskGroupModel> get citizenRiskGroups {
    _$citizenRiskGroupsAtom.context.enforceReadPolicy(_$citizenRiskGroupsAtom);
    _$citizenRiskGroupsAtom.reportObserved();
    return super.citizenRiskGroups;
  }

  @override
  set citizenRiskGroups(ObservableList<RiskGroupModel> value) {
    _$citizenRiskGroupsAtom.context.conditionallyRunInAction(() {
      super.citizenRiskGroups = value;
      _$citizenRiskGroupsAtom.reportChanged();
    }, _$citizenRiskGroupsAtom, name: '${_$citizenRiskGroupsAtom.name}_set');
  }

  final _$citizenContactAtom =
      Atom(name: '_AnalisyControllerBase.citizenContact');

  @override
  CovidContactModel get citizenContact {
    _$citizenContactAtom.context.enforceReadPolicy(_$citizenContactAtom);
    _$citizenContactAtom.reportObserved();
    return super.citizenContact;
  }

  @override
  set citizenContact(CovidContactModel value) {
    _$citizenContactAtom.context.conditionallyRunInAction(() {
      super.citizenContact = value;
      _$citizenContactAtom.reportChanged();
    }, _$citizenContactAtom, name: '${_$citizenContactAtom.name}_set');
  }

  final _$phoneAtom = Atom(name: '_AnalisyControllerBase.phone');

  @override
  String get phone {
    _$phoneAtom.context.enforceReadPolicy(_$phoneAtom);
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.context.conditionallyRunInAction(() {
      super.phone = value;
      _$phoneAtom.reportChanged();
    }, _$phoneAtom, name: '${_$phoneAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_AnalisyControllerBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$sexAtom = Atom(name: '_AnalisyControllerBase.sex');

  @override
  String get sex {
    _$sexAtom.context.enforceReadPolicy(_$sexAtom);
    _$sexAtom.reportObserved();
    return super.sex;
  }

  @override
  set sex(String value) {
    _$sexAtom.context.conditionallyRunInAction(() {
      super.sex = value;
      _$sexAtom.reportChanged();
    }, _$sexAtom, name: '${_$sexAtom.name}_set');
  }

  final _$healthCenterAtom = Atom(name: '_AnalisyControllerBase.healthCenter');

  @override
  HealthCenterModel get healthCenter {
    _$healthCenterAtom.context.enforceReadPolicy(_$healthCenterAtom);
    _$healthCenterAtom.reportObserved();
    return super.healthCenter;
  }

  @override
  set healthCenter(HealthCenterModel value) {
    _$healthCenterAtom.context.conditionallyRunInAction(() {
      super.healthCenter = value;
      _$healthCenterAtom.reportChanged();
    }, _$healthCenterAtom, name: '${_$healthCenterAtom.name}_set');
  }

  final _$resultCepAtom = Atom(name: '_AnalisyControllerBase.resultCep');

  @override
  ResultCep get resultCep {
    _$resultCepAtom.context.enforceReadPolicy(_$resultCepAtom);
    _$resultCepAtom.reportObserved();
    return super.resultCep;
  }

  @override
  set resultCep(ResultCep value) {
    _$resultCepAtom.context.conditionallyRunInAction(() {
      super.resultCep = value;
      _$resultCepAtom.reportChanged();
    }, _$resultCepAtom, name: '${_$resultCepAtom.name}_set');
  }

  final _$ageAtom = Atom(name: '_AnalisyControllerBase.age');

  @override
  int get age {
    _$ageAtom.context.enforceReadPolicy(_$ageAtom);
    _$ageAtom.reportObserved();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.context.conditionallyRunInAction(() {
      super.age = value;
      _$ageAtom.reportChanged();
    }, _$ageAtom, name: '${_$ageAtom.name}_set');
  }

  final _$cepAtom = Atom(name: '_AnalisyControllerBase.cep');

  @override
  String get cep {
    _$cepAtom.context.enforceReadPolicy(_$cepAtom);
    _$cepAtom.reportObserved();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.context.conditionallyRunInAction(() {
      super.cep = value;
      _$cepAtom.reportChanged();
    }, _$cepAtom, name: '${_$cepAtom.name}_set');
  }

  final _$neighborhoodAtom = Atom(name: '_AnalisyControllerBase.neighborhood');

  @override
  String get neighborhood {
    _$neighborhoodAtom.context.enforceReadPolicy(_$neighborhoodAtom);
    _$neighborhoodAtom.reportObserved();
    return super.neighborhood;
  }

  @override
  set neighborhood(String value) {
    _$neighborhoodAtom.context.conditionallyRunInAction(() {
      super.neighborhood = value;
      _$neighborhoodAtom.reportChanged();
    }, _$neighborhoodAtom, name: '${_$neighborhoodAtom.name}_set');
  }

  final _$hasFeverAtom = Atom(name: '_AnalisyControllerBase.hasFever');

  @override
  bool get hasFever {
    _$hasFeverAtom.context.enforceReadPolicy(_$hasFeverAtom);
    _$hasFeverAtom.reportObserved();
    return super.hasFever;
  }

  @override
  set hasFever(bool value) {
    _$hasFeverAtom.context.conditionallyRunInAction(() {
      super.hasFever = value;
      _$hasFeverAtom.reportChanged();
    }, _$hasFeverAtom, name: '${_$hasFeverAtom.name}_set');
  }

  final _$feverValueAtom = Atom(name: '_AnalisyControllerBase.feverValue');

  @override
  double get feverValue {
    _$feverValueAtom.context.enforceReadPolicy(_$feverValueAtom);
    _$feverValueAtom.reportObserved();
    return super.feverValue;
  }

  @override
  set feverValue(double value) {
    _$feverValueAtom.context.conditionallyRunInAction(() {
      super.feverValue = value;
      _$feverValueAtom.reportChanged();
    }, _$feverValueAtom, name: '${_$feverValueAtom.name}_set');
  }

  final _$otherSymptonAtom = Atom(name: '_AnalisyControllerBase.otherSympton');

  @override
  String get otherSympton {
    _$otherSymptonAtom.context.enforceReadPolicy(_$otherSymptonAtom);
    _$otherSymptonAtom.reportObserved();
    return super.otherSympton;
  }

  @override
  set otherSympton(String value) {
    _$otherSymptonAtom.context.conditionallyRunInAction(() {
      super.otherSympton = value;
      _$otherSymptonAtom.reportChanged();
    }, _$otherSymptonAtom, name: '${_$otherSymptonAtom.name}_set');
  }

  final _$otherRiskGroupAtom =
      Atom(name: '_AnalisyControllerBase.otherRiskGroup');

  @override
  String get otherRiskGroup {
    _$otherRiskGroupAtom.context.enforceReadPolicy(_$otherRiskGroupAtom);
    _$otherRiskGroupAtom.reportObserved();
    return super.otherRiskGroup;
  }

  @override
  set otherRiskGroup(String value) {
    _$otherRiskGroupAtom.context.conditionallyRunInAction(() {
      super.otherRiskGroup = value;
      _$otherRiskGroupAtom.reportChanged();
    }, _$otherRiskGroupAtom, name: '${_$otherRiskGroupAtom.name}_set');
  }

  final _$uploadAnalisyAsyncAction = AsyncAction('uploadAnalisy');

  @override
  Future<Null> uploadAnalisy({@required double lat, @required double lng}) {
    return _$uploadAnalisyAsyncAction
        .run(() => super.uploadAnalisy(lat: lat, lng: lng));
  }

  final _$_AnalisyControllerBaseActionController =
      ActionController(name: '_AnalisyControllerBase');

  @override
  dynamic changeSex(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeSex(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeHealthCenter(HealthCenterModel value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeHealthCenter(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePageState(AnalisyStatus status) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changePageState(status);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNeighborhood(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeNeighborhood(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCep(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeCep(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAge(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeAge(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePhoneNumber(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changePhoneNumber(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeOtherSympton(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeOtherSympton(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeOtherRiskGroup(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeOtherRiskGroup(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeContact(CovidContactModel contact) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeContact(contact);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addSympton(SymptonModel symptonModel) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.addSympton(symptonModel);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeSympton(SymptonModel symptonModel) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.removeSympton(symptonModel);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addRiskGroup(RiskGroupModel riskGroupModel) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.addRiskGroup(riskGroupModel);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeRiskGroup(RiskGroupModel riskGroupModel) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.removeRiskGroup(riskGroupModel);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFever() {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeFever();
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFeverValue(String value) {
    final _$actionInfo = _$_AnalisyControllerBaseActionController.startAction();
    try {
      return super.changeFeverValue(value);
    } finally {
      _$_AnalisyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pageStatus: ${pageStatus.toString()},symptons: ${symptons.toString()},contacts: ${contacts.toString()},citizenSymptons: ${citizenSymptons.toString()},riskGroups: ${riskGroups.toString()},citizenRiskGroups: ${citizenRiskGroups.toString()},citizenContact: ${citizenContact.toString()},phone: ${phone.toString()},name: ${name.toString()},sex: ${sex.toString()},healthCenter: ${healthCenter.toString()},resultCep: ${resultCep.toString()},age: ${age.toString()},cep: ${cep.toString()},neighborhood: ${neighborhood.toString()},hasFever: ${hasFever.toString()},feverValue: ${feverValue.toString()},otherSympton: ${otherSympton.toString()},otherRiskGroup: ${otherRiskGroup.toString()},validateName: ${validateName.toString()},validateAge: ${validateAge.toString()},validateCep: ${validateCep.toString()},validateNeighborhood: ${validateNeighborhood.toString()},validateFever: ${validateFever.toString()},validatePhone: ${validatePhone.toString()}';
    return '{$string}';
  }
}

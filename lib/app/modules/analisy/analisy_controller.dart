import 'package:covid19app/app/modules/analisy/analisy_repository.dart';
import 'package:covid19app/app/shared/models/analisy_model.dart';
import 'package:covid19app/app/shared/models/citizen_model.dart';
import 'package:covid19app/app/shared/models/covid_contact_model.dart';
import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:covid19app/app/shared/models/result_cep_model.dart';
import 'package:covid19app/app/shared/models/risk_group_model.dart';
import 'package:covid19app/app/shared/models/sympton_model.dart';
import 'package:flutter/foundation.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

part 'analisy_controller.g.dart';

class AnalisyController = _AnalisyControllerBase with _$AnalisyController;

abstract class _AnalisyControllerBase with Store {
  final AnalisyRepository _repository;

  @observable
  AnalisyStatus pageStatus = AnalisyStatus.loading;

  final maskPhone = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
  final maskCep = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  @observable
  List<SymptonModel> symptons;

  @observable
  List<CovidContactModel> contacts;

  @observable
  ObservableList<SymptonModel> citizenSymptons;

  @observable
  List<RiskGroupModel> riskGroups;

  @observable
  ObservableList<RiskGroupModel> citizenRiskGroups;

  @observable
  CovidContactModel citizenContact;

  @observable
  String phone;

  @observable
  String name;

  @observable
  String sex;

  @observable
  HealthCenterModel healthCenter;

  @observable
  ResultCep resultCep;

  @action
  changeSex(String value) {
    this.sex = value;
  }

  @action
  changeHealthCenter(HealthCenterModel value) {
    this.healthCenter = value;
  }

  @action
  changePageState(AnalisyStatus status) => this.pageStatus = status;

  @action
  changeName(String value) {
    if (value.isEmpty) {
      this.name = null;
    } else {
      this.name = value;
    }
  }

  //
  @action
  changeNeighborhood(String value) {
    if (value.isEmpty) {
      this.neighborhood = null;
    } else {
      this.neighborhood = value;
    }
  }

  @computed
  String get validateName {
    if (this.name == null || this.name.length < 0) {
      return "Insira o seu nome completo";
    }
    return null;
  }

  @computed
  String get validateAge {
    if (this.age == null) {
      return "Informe a sua idade";
    } else if (this.age > 120 || this.age < 0) {
      return "Insira uma idade válida";
    }
    return null;
  }

  @observable
  int age;

  @observable
  String cep;

  @observable
  String neighborhood;

  // @action
  // void setNeighborhood(value) => neighborhood = value;

  @computed
  String get validateCep {
    if (this.cep != null) {
      if (this.cep.length < 9) {
        return "Insira um cep válido";
      }
    } else {
      return "Informe um cep válido";
    }
    return null;
  }

  @computed
  String get validateNeighborhood {
    if (this.neighborhood == null || this.neighborhood.length < 0) {
      return "Insira o seu bairro";
    }
    return null;
  }

  @observable
  bool hasFever;

  @computed
  String get validateFever {
    if (this.feverValue != null) {
      if (this.feverValue < 0 || this.feverValue > 50) {
        return "Insira um valor válido";
      }
      return null;
    }
    return null;
  }

  @observable
  double feverValue;
  @action
  void changeCep(String value) {
    if (value.length == 9) {
      this.cep = value;
      var currentCep = removeMask(this.cep);
      this._fetchCep(currentCep);
    }
    if (value == null || value.isEmpty) this.cep = null;
  }

  @action
  void changeAge(String value) {
    if (value == null || value.isEmpty) {
      this.age = null;
    }
    if (value != null && value.isNotEmpty) {
      this.age = int.parse(value);
    }
  }

  @action
  void changePhoneNumber(String value) => this.phone = value;
  @computed
  String get validatePhone {
    if (this.phone == null || this.phone.isEmpty) {
      return "Insira um telefone";
    } else if (this.phone.length < 15) {
      return "insira um telefone válido";
    }
    return null;
  }

  @observable
  String otherSympton;

  @action
  void changeOtherSympton(String value) {
    this.otherSympton = value;

    if (value == null || value.isEmpty || value.trim().isEmpty) {
      this.otherSympton = null;
    }
  }

  @observable
  String otherRiskGroup;
  @action
  void changeOtherRiskGroup(String value) {
    this.otherRiskGroup = value;
    if (value.isEmpty || value.trim().isEmpty) {
      this.otherRiskGroup = null;
    }
  }

  @action
  void changeContact(CovidContactModel contact) =>
      this.citizenContact = contact;

  @action
  addSympton(SymptonModel symptonModel) {
    citizenSymptons.add(symptonModel);
  }

  @action
  removeSympton(SymptonModel symptonModel) {
    citizenSymptons.remove(symptonModel);
  }

  @action
  addRiskGroup(RiskGroupModel riskGroupModel) {
    citizenRiskGroups.add(riskGroupModel);
  }

  @action
  removeRiskGroup(RiskGroupModel riskGroupModel) {
    citizenRiskGroups.remove(riskGroupModel);
  }

  @action
  void changeFever() {
    this.hasFever = !this.hasFever;
  }

  @action
  void changeFeverValue(String value) {
    if (value.isEmpty) {
      this.feverValue = null;
    } else {
      try {
        double feverTemp = double.parse(value);
        this.feverValue = feverTemp;
      } catch (_) {
        this.feverValue = null;
      }
    }
  }

  _AnalisyControllerBase(this._repository) {
    citizenSymptons = ObservableList();
    citizenRiskGroups = ObservableList();

    fetchAll();
  }

  fetchAll() async {
    try {
      await _fetchSymptons();
      await _fetchContacts();
      await _fetchRiskGroups();

      this.pageStatus = changePageState(AnalisyStatus.sucess);
    } catch (e) {
      this.pageStatus = changePageState(AnalisyStatus.error);
    }
  }

  _fetchRiskGroups() async {
    this.riskGroups = await _repository.fetchRiskGroups();
  }

  _fetchSymptons() async {
    symptons = await _repository.fetchSympton();
  }

  _fetchContacts() async {
    contacts = await _repository.fetchContacts();
  }

  _fetchCep(String cep) async {
    neighborhood = '';
    resultCep = await _repository.fetchCep(cep);
    // Caso venha vazio não exibir input
    if (resultCep != null) {
      neighborhood = resultCep.bairro;
    }
  }

  String removeMask(String value) {
    if (value != null) {
      return value.replaceAll('-', '').replaceAll('(', '').replaceAll(')', '');
    } else {
      return null;
    }
  }

  @action
  Future<Null> uploadAnalisy({
    @required double lat,
    @required double lng,
  }) async {
    this.pageStatus = AnalisyStatus.loading;
    try {
      final citizen = CitizenModel(
        name: this.name,
        sex: this.sex,
        otherRiskGroup: this.otherRiskGroup,
        phoneNumber: removeMask(this.phone),
        age: this.age,
        cep: removeMask(this.cep),
        listRiskGroup: this.citizenRiskGroups.toList(),
        street: this.resultCep.logradouro,
        neighbordhood: this.resultCep.bairro,
        healthCenter: this.healthCenter.id,
      );
      final citizenID = await _repository.postCitizen(citizen);

      final analisy = AnalisyModel(
        date: DateTime.now(),
        hasFaver: this.hasFever,
        fever: this.feverValue,
        citizen: citizenID,
        lat: lat,
        lng: lng,
        covidContact: this.citizenContact,
        listSympton: this.citizenSymptons.toList(),
        otherSympton: this.otherSympton,
      );

      await _repository.postAnalisy(analisy);
      changePageState(AnalisyStatus.sucess);
    } catch (e) {
      changePageState(AnalisyStatus.error);
    }
  }
}

enum AnalisyStatus { loading, sucess, none, error }

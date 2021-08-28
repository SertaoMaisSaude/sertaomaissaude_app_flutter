import 'package:covid19app/app/app_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/shared/models/boletim_line_model.dart';
import 'package:covid19app/app/shared/models/daily_news_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'daily_news_controller.g.dart';

class DailyNewsController = _DailyNewsControllerBase with _$DailyNewsController;

abstract class _DailyNewsControllerBase with Store {
  final _appController = AppModule.to.get<AppController>();

  @observable
  List<DailyNewsModel> boletins;

  @observable
  BoletimLineModel boletimSelected;

  _DailyNewsControllerBase() {
    _fetchBoletins();
  }

  _fetchBoletins() async {
    this.boletins = _appController.dailyNews;
    this.boletimSelected = confirmed;
  }

  double gethighestValue(BoletimLineModel boletim) {
    return boletim.spots
            .reduce((curr, next) => (curr.y > next.y) ? curr : next)
            .y +
        1;
  }

  @action
  void changeBoletimSelected(BoletimLineModel model) {
    this.boletimSelected = model;
  }

  @computed
  BoletimLineModel get confirmed {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.confirmed.toDouble()))
        .toList();
    return BoletimLineModel(
      title: "Confirmados",
      color: Colors.red[600],
      spots: spots,
    );
  }

  @computed
  BoletimLineModel get deaths {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.deaths.toDouble()))
        .toList();
    return BoletimLineModel(
      title: "Mortes",
      color: Colors.red[900],
      spots: spots,
    );
  }

  @computed
  BoletimLineModel get discarded {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.discarded.toDouble()))
        .toList();
    return BoletimLineModel(
        title: "Descartados", color: Colors.green, spots: spots);
  }

  @computed
  BoletimLineModel get recovered {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.recovered.toDouble()))
        .toList();
    return BoletimLineModel(
        title: "Recuperados", color: Colors.blue, spots: spots);
  }

  @computed
  BoletimLineModel get underInvestigation {
    final spots = boletins
        .asMap()
        .entries
        .map((e) =>
            FlSpot(e.key.toDouble(), e.value.underInvestigation.toDouble()))
        .toList();
    return BoletimLineModel(
        title: "Em investigação", color: Colors.red, spots: spots);
  }

  @computed
  BoletimLineModel get waitingExam {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.waitingExam.toDouble()))
        .toList();
    return BoletimLineModel(
        title: "Aguardando exame", color: Colors.yellow[700], spots: spots);
  }

  @computed
  BoletimLineModel get homeIsolation {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.homeIsolation.toDouble()))
        .toList();
    return BoletimLineModel(
        title: "Isolamento domiciliar",
        color: Colors.orange[300],
        spots: spots);
  }

  @computed
  BoletimLineModel get hospitalStay {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.hospitalStay.toDouble()))
        .toList();
    return BoletimLineModel(
        title: "Internamento hospitalar",
        color: Colors.orange[300],
        spots: spots);
  }

  @computed
  BoletimLineModel get testsCounty {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.testsCounty.toDouble()))
        .toList();
    return BoletimLineModel(
        title: "Exames - Laboratório Municipal",
        color: Colors.green[300],
        spots: spots);
  }

  @computed
  BoletimLineModel get testsLacen {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.testsLacen.toDouble()))
        .toList();
    return BoletimLineModel(
      title: "Exames - Lacen Pernambuco",
      color: Colors.orange[300],
      spots: spots,
    );
  }

  @computed
  BoletimLineModel get testsPrivate {
    final spots = boletins
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.testsPrivate.toDouble()))
        .toList();
    return BoletimLineModel(
      title: "Exames - Particulares",
      color: Colors.red[300],
      spots: spots,
    );
  }
}

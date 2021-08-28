import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BoletimLineModel{
  final String title;
  final Color color;
  final List<FlSpot> spots;

  BoletimLineModel({@required this.title, @required this.color, @required this.spots});
}
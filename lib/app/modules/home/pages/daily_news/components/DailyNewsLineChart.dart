import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/daily_news_controller.dart';
import 'package:covid19app/app/shared/models/boletim_line_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DailyNewsLineChart extends StatelessWidget {
  final _controller = HomeModule.to.get<DailyNewsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.only(left: 16, right: 28),
      child: Observer(
        builder: (_) {
          return LineChart(
            sampleData(_controller.boletimSelected),
            swapAnimationDuration: const Duration(milliseconds: 500),
          );
        },
      ),
    );
  }

  LineChartData sampleData(BoletimLineModel boletim) {
    return LineChartData(
      gridData: FlGridData(show: false),
      lineTouchData: LineTouchData(
        enabled: true, // Exibe o toltip do valor
        touchTooltipData: LineTouchTooltipData(
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          tooltipBgColor: _controller.boletimSelected.color,
          tooltipRoundedRadius: 15,
          maxContentWidth: 100,
          // Largura maxima do toltip
          getTooltipItems: (List<LineBarSpot> lineBarsSpot) => lineBarsSpot
              .map(
                (lineBarSpot) => LineTooltipItem(
                  lineBarSpot.y.toInt().toString(),
                  const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
              .toList(),
        ),
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          textStyle: const TextStyle(
            color: Color(0xff72719b),
            fontSize: 12,
          ),
          margin: 34,
          rotateAngle: -45,
          getTitles: (value) {
            try {
              final data = _controller.boletins[value.toInt()].datePublication;
              return '${data.day}/${data.month}';
            } catch (_) {
              return "";
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) => value.toInt().toString(),
          interval: _getInterval(boletim),
          reservedSize: 16,
          margin: 16,
          // rotateAngle: -45,
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: boletim.spots.length.toDouble() - 1,
      maxY: _controller.gethighestValue(boletim),
      minY: 0,
      lineBarsData: [
        line(flSpot: boletim.spots, color: boletim.color),
      ],
    );
  }

  double _getInterval(BoletimLineModel boletim) {
    double maxValue = _controller.gethighestValue(boletim);
    if (maxValue >= 100) {
      return maxValue / 10;
    } else if (maxValue >= 50) {
      return 20;
    } else if (maxValue >= 20) {
      return 10;
    } else if (maxValue >= 10) {
      return 5;
    }
    return 1;
  }

  LineChartBarData line({
    @required List<FlSpot> flSpot,
    @required Color color,
  }) {
    return LineChartBarData(
      spots: flSpot,
      isCurved: true,
      colors: [color],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true, dotSize: 3),
      belowBarData: BarAreaData(
        show: true,
        gradientColorStops: [0.1, 0.9],
        colors: [
          color.withOpacity(0.3),
          Colors.white,
        ],
        gradientFrom: Offset.zero,
        gradientTo: Offset.fromDirection(1.55),
      ),
    );
  }
}

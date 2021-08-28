import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/daily_news_controller.dart';
import 'package:covid19app/app/shared/models/boletim_line_model.dart';
import 'package:flutter/material.dart';

class BoletimListItem extends StatelessWidget {
  final _controller = HomeModule.to.get<DailyNewsController>();
  final BoletimLineModel boletimLineModel;

  BoletimListItem({Key key, @required this.boletimLineModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _controller.changeBoletimSelected(boletimLineModel);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                boletimLineModel.spots.last.y.toInt().toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: boletimLineModel.color,
                ),
              ),
              Text(
                "${boletimLineModel.title}",
                style: TextStyle(fontSize: 16, color: Colors.grey),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

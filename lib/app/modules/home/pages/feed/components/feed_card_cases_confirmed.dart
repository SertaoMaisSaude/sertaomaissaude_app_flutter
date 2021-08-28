import 'package:covid19app/app/app_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/daily_news_page.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeedCardCasesConfirmed extends StatelessWidget {
  final _controller = AppModule.to.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DailyNewsPage(),
        ),
      ),
      child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                color: Colors.grey[300],
                blurRadius: 4,
              ),
            ],
          ),
          child: Observer(
            builder: (_) {
              if (_controller.dailyNews == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _getItem(
                        _controller.dailyNews.last.underInvestigation,
                        "Investigação",
                        Color(0xffFF9F76),
                      ),
                      _getItem(
                        _controller.dailyNews.last.discarded,
                        "Descartados",
                        Color(0xff43D8A1),
                      ),
                      _getItem(
                        _controller.dailyNews.last.confirmed,
                        "Confirmados",
                        Color(0xffF86E6E),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 10,
                      ),
                      // TODO corrigir cidade para vim da api
                      Text(
                        'Serra Talhada - PE, ${formatDate(_controller.dailyNews.last.date, [
                          dd,
                          '-',
                          mm,
                          '-',
                          yyyy
                        ])}',
                        //"Serra Talhada - PE, 07 de maio de 2020",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8E99AF)),
                      ),
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }

  _getItem(final data, String level, Color color) {
    return Column(
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.all(6),
        //   height: 20,
        //   width: 20,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: color.withOpacity(.26),
        //   ),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Colors.transparent,
        //       border: Border.all(
        //         color: color,
        //         width: 2,
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(height: 10),
        Text(
          "$data",
          style: TextStyle(
              fontSize: 30, color: color, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          level,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff8E99AF)),
        ),
      ],
    );
  }
}

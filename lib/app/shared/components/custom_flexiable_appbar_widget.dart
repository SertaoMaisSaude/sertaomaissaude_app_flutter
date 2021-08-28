import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  final DateTime date;

  CustomFlexiableAppBar({@required this.date});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Text("Boletim COVID-19",
                      textAlign: TextAlign.start,
                      style:
                          const TextStyle(fontSize: 22, color: Colors.black54)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Center(
                    child: Text(
                      "Dados Oficiais - Serra Talhada",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 26),
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            FontAwesomeIcons.calendarAlt,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            '${date.day}/${date.month}/${date.year}',
                            style: const TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Poppins',
                                fontSize: 16.0),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

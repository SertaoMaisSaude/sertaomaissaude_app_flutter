import 'package:flutter/material.dart';

class DirectionCard extends StatelessWidget {
  final bool risk;
  final Color color;
  final String text;
  final String title;

  const DirectionCard(
      {Key key,
      this.risk = false,
      @required this.color,
      @required this.text,
      @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.risk == true ? this.color : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 4),
              blurRadius: 4,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: this.risk == true ? Colors.white : Colors.grey,
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

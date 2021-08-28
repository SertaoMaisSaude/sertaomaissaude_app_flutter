import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedCardHintsAnalisy extends StatelessWidget {
  final String title;
  final String icon;
  final String router;

  const FeedCardHintsAnalisy({this.title, this.icon, this.router});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(this.router);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.width * 0.40,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
            color: Color(0xFF05A8F3),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, offset: Offset(0, 4), color: Colors.blue[200])
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3 / 2.1,
              child: Image.asset(
                this.icon,
              ),
            ),
            Spacer(),
            Text(
              this.title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

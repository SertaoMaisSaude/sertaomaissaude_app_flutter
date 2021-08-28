import 'package:covid19app/app/shared/models/health_tips_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class HealthTipsWidget extends StatelessWidget {
  final HealthTipsModel _healthTipsModel;

  const HealthTipsWidget(this._healthTipsModel);

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;

    return Container(
      height: hp(20),
      width: wp(100),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[100],
              blurRadius: 4.0,
              spreadRadius: 3.5,
              offset: Offset(0.0, 2)),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: this._healthTipsModel.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(this._healthTipsModel.title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff4E585A),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(this._healthTipsModel.body,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff4E585A).withOpacity(0.5))),
                        ],
                      ),
                    )
                  ]),
            )
          ]),
    );
  }
}

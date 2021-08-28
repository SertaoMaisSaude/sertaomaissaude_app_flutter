import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/health_centers/health_centers_controller.dart';
import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:flutter/material.dart';

class HealthCenterTile extends StatelessWidget {
  final HealthCenterModel healthCenter;
  final _controller = HomeModule.to.get<HealthCentersController>();

  HealthCenterTile({Key key, @required this.healthCenter}) : super(key: key);

  // Widget _textColumn({@required String content}) {
  //   if (content == null) {
  //     return Container();
  //   }
  //   return Row(
  //     children: [
  //       Icon(
  //         Icons.place,
  //         size: 20,
  //       ),
  //       RichText(
  //         text: TextSpan(
  //           children: <TextSpan>[
  //             TextSpan(
  //                 text: "$content",
  //                 style: TextStyle(color: Colors.black.withOpacity(0.5))),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget addressTile() {
    if (healthCenter.neighborhood == null || healthCenter.street == null) {
      return Container();
    }
    return ListTile(
      onTap: () {
        if (healthCenter.lat != null && healthCenter.long != null) {
          _controller.openMap(healthCenter.lat, healthCenter.long);
        }
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          healthCenter.neighborhood != null
              ? Text(
                  healthCenter.neighborhood,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              : Container(),
          SizedBox(height: 4),
          healthCenter.street != null
              ? Text(
                  healthCenter.street,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              : Container(),
          SizedBox(height: 4),
          healthCenter.streetNumber != null
              ? Text(
                  healthCenter.streetNumber,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              : Container()
        ],
      ),
      leading: Icon(Icons.place, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              offset: Offset(4, 4),
            ),
          ],
        ),
        margin: EdgeInsets.all(12),
//        padding: EdgeInsets.only(bottom: 6, left: 18, right: 8, top: 12),
        child: ExpansionTile(
          title: Text(healthCenter.name),
          children: [
            healthCenter.neighborhood == null ? Container() : addressTile(),
            healthCenter.phone == null
                ? Container()
                : ListTile(
                    onTap: () {},
                    title: Text(healthCenter.phone),
                    trailing: Icon(Icons.phone, color: Colors.red)),
          ],
        )

//      Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Row(
//            children: [
//              Text(
//                healthCenter.name,
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//            ],
//          ),
//          SizedBox(height: 14),
//          _textColumn(content: healthCenter.street),
//          _textColumn(content: healthCenter.phone),
//          _textColumn(content: healthCenter.phone),
//          Container(
//            padding: EdgeInsets.all(6),
//            margin: EdgeInsets.only(top: 8, bottom: 8),
//            decoration: BoxDecoration(
//              border: Border.all(width: 1, color: Colors.blue),
//              borderRadius: BorderRadius.all(Radius.circular(16))
//            ),
//            child: Text(
//              '${healthCenter.neighborhood}',
//              style: TextStyle(fontSize: 12),
//            ),
//          ),
////        Text(healthCenter.neighborhood),
//        ],
//      ),
        );
  }
}

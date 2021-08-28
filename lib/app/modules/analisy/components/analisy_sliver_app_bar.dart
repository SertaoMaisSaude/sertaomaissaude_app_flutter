import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlisySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String image;
  AlisySliverAppBar({@required this.image, @required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/capa.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff05A8F3),
                Color(0xff05A8F3),
              ]),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Container(
                height: 80,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Sertão",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                      children: [
                        TextSpan(
                          text: ' Saúde',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  //),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.6 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 20,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - 40,
              child: image != null
                  ? Image.asset(image)
                  : Icon(
                      FontAwesomeIcons.heartbeat,
                      size: 50,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
        Positioned(
          top: 26,
          child: BackButton(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

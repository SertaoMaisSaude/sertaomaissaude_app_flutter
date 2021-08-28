import 'package:covid19app/app/shared/utils/theme.dart';
import 'package:flutter/material.dart';

class AboutSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  AboutSliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
            decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        )),
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
                    text: TextSpan(children: [
                      TextSpan(text: 'Sertão ', style: TextStyle(fontSize: 22)),
                      TextSpan(
                          text: 'Saúde',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                  ),
                  //),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 4.0 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 20,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width - 40,
                child: Image.asset("assets/images/logo.png")),
          ),
        ),
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

import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  final Size sizeBar;
  final double bottomLeftSize;
  final double bottomRightSize;

  AppBarCustom({
    Widget title,
    this.bottomLeftSize = 150,
    this.bottomRightSize = 150,
    this.sizeBar,
    bool centerTitle = true,
    Color backgroundColor = Colors.white,
    Color leadingIconColor = Colors.black54,
    double elevation = 2,
    IconButton leading, 
  }) : super(
          iconTheme: IconThemeData(
            color: leadingIconColor,
          ),
          elevation: elevation,
          leading: leading,
          centerTitle: centerTitle,
          backgroundColor:backgroundColor,
          title: title,
        );

  @override
  ShapeBorder get shape => ContinuousRectangleBorder(  
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(this.bottomLeftSize),
          bottomRight: Radius.circular(this.bottomRightSize)));

  @override
  Size get preferredSize => sizeBar ?? super.preferredSize;
}

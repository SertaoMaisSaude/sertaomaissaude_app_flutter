import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeData() {
    return ThemeData(
      textTheme: _textTheme(),
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Color(0xFFF5F6F6),
      dividerColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
      ),
    );
  }

  TextTheme _textTheme() {
    return TextTheme();
  }
}

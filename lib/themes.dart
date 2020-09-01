import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData themeData() {
  return ThemeData(
      accentColor: kAccentColor,
      appBarTheme: appBarTheme(),
      scaffoldBackgroundColor: kPrimaryColor,
      fontFamily: "Futura",
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: kPrimaryColor,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: textTheme());
}

TextTheme textTheme() {
  return TextTheme(
      headline6:
          TextStyle(color: Colors.grey, fontSize: 18, fontFamily: "futura"));
}

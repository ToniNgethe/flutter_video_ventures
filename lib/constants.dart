import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF202329);
const kPrimaryLightColor = Color(0xFF2B2F37);
const kTextColor = Color(0xFF757575);
const kAccentColor = Colors.deepOrange;

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
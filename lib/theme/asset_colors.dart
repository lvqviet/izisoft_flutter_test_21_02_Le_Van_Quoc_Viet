import 'package:flutter/material.dart';

abstract class AppColors {
  static Color shimmerBaseColor = Colors.grey.withOpacity(0.8);
  static Color shimmerHighlightColor = Colors.grey.withOpacity(0.5);
  static Color primary = const Color(0xFF009E75);
  static Color primaryDark = const Color(0xFF62A07F);
  static Color primaryLight = const Color(0xFFE5F4F4);
  static Color secondary = const Color(0xFFF1A642);
  static Color secondaryLight = const Color(0xFFF6F2ED);
  static Color secondaryDark = const Color(0xFFF6F2ED);
  static Color branchColor = const Color(0xFFF6F2ED);
  static Color backgroundColor = const Color(0xFFFAFAFA);

  static const Color colorWhite = Color(0xffFFFFFF);
  static const Color colorFAFAFA = Color(0xffFAFAFA);
  static const Color colorF5F5F5 = Color(0xffF5F5F5);
  static const Color colorF0F0F0 = Color(0xffF0F0F0);
  static const Color colorD9D9D9 = Color(0xffD9D9D9);
  static const Color colorBFBFBF = Color(0xffBFBFBF);
  static const Color color8C8C8C = Color(0xff8C8C8C);
  static const Color color595959 = Color(0xff595959);
  static const Color color434343 = Color(0xff434343);
  static const Color color262626 = Color(0xff262626);
  static const Color color1F1F1F = Color(0xff1F1F1F);
  static const Color color141414 = Color(0xff141414);
  static const Color colorF9F9F9 = Color(0xFFF9F9F9);
  static const Color colorUrl = Color(0xff3366CC);

  static Color? colorFromHex(String? hexColor) {
    if (hexColor == null) {
      return null;
    }

    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}

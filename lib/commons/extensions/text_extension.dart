import 'package:flutter/material.dart';
import '../../theme/theme.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get thin => weight(FontWeight.w100);

  TextStyle get extraLight => weight(FontWeight.w200);

  TextStyle get light => weight(FontWeight.w300);

  TextStyle get regular => weight(FontWeight.w400);

  TextStyle get medium => weight(FontWeight.w500);

  TextStyle get semiBold => weight(FontWeight.w600);

  TextStyle get bold => weight(FontWeight.w700);

  TextStyle get w9 => weight(FontWeight.w900);

  TextStyle get w8 => weight(FontWeight.w800);

  TextStyle get italic => fontStyleT(FontStyle.italic);

  TextStyle get normal => fontStyleT(FontStyle.normal);

  TextStyle size(double size) => copyWith(fontSize: size);

  TextStyle textColor(Color v) => copyWith(color: v);

  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  TextStyle fontStyleT(FontStyle v) => copyWith(fontStyle: v);

  TextStyle setDecoration(TextDecoration v) => copyWith(decoration: v);

  TextStyle letterSpaC(double v) => copyWith(letterSpacing: v);

  TextStyle heightLine(double v) => copyWith(height: v / fontSize!);

  TextStyle get textWhite => textColor(Colors.white);

  TextStyle get textPrimary => textColor(AppColors.primary);

  TextStyle get textSecondary => textColor(AppColors.secondary);

  TextStyle get textColorFAFAFA => textColor(AppColors.colorFAFAFA);

  TextStyle get textColorF5F5F5 => textColor(AppColors.colorF5F5F5);

  TextStyle get textColorF0F0F0 => textColor(AppColors.colorF0F0F0);

  TextStyle get textColorD9D9D9 => textColor(AppColors.colorD9D9D9);

  TextStyle get textColorBFBFBF => textColor(AppColors.colorBFBFBF);

  TextStyle get textColor8C8C8C => textColor(AppColors.color8C8C8C);

  TextStyle get textColor595959 => textColor(AppColors.color595959);

  TextStyle get textColor434343 => textColor(AppColors.color434343);

  TextStyle get textColor262626 => textColor(AppColors.color262626);

  TextStyle get textColor1F1F1F => textColor(AppColors.color1F1F1F);

  TextStyle get textColor141414 => textColor(AppColors.color141414);

  TextStyle get decorationUnderline => setDecoration(TextDecoration.underline);

  TextStyle get decorationLineThrough => setDecoration(TextDecoration.lineThrough);
}

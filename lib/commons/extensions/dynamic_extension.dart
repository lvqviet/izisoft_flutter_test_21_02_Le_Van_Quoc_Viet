import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DynamicExtension on dynamic {
  String get formatCurrencyNoName {
    const locale = 'en';
    const currencyName = '';
    const errorText = '0';
    var formatter = NumberFormat.currency(
        locale: locale, name: currencyName, decimalDigits: 2, customPattern: "#,###.##\u00A4");
    switch (runtimeType) {
      case num:
      case int:
      case double:
        return formatter.format(this);
      case String:
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        return formatter.format(value);
      default:
        return errorText;
    }
  }

  String get formatCurrency {
    const locale = 'en';
    const errorText = '0';

    switch (runtimeType) {
      case num:
      case int:
      case double:
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        if (this % 1 != 0) {
          formatter = NumberFormat.simpleCurrency(
            locale: locale,
            decimalDigits: 2,
          );
        }
        return formatter.format(this);
      case String:
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        var formatter = NumberFormat.simpleCurrency(
          locale: locale,
          decimalDigits: 0,
        );
        if (value % 1 != 0) {
          formatter = NumberFormat.simpleCurrency(
            locale: locale,
            decimalDigits: 2,
          );
        }
        return formatter.format(value);
      default:
        return errorText;
    }
  }

  String get formatDecimalPattern {
    return this is num ? NumberFormat.decimalPattern().format(this) : this;
  }

  String get formatPluralNouns {
    return this is int
        ? this > 1
            ? 's'
            : ''
        : '';
  }
}

extension ColorExtension on String {
  Color get toColor {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.transparent;
  }
}

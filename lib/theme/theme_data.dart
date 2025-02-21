
import 'package:flutter/material.dart';
import 'package:izi_app/commons/extensions/extension.dart';
import 'theme.dart';

class AppThemeData {
  static final InputBorder _inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.colorF0F0F0, width: 1),
    borderRadius: BorderRadius.circular(8),
  );
  static ThemeData generateThemeData({
    required Color branchColor,
    required Color primaryColor,
    required Color secondaryColor,
    required Color lightPrimaryColor,
    required Color lightSecondaryColor,
  }) {
    final colorScheme = ColorScheme(
      primary: primaryColor,
      secondary: primaryColor,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Instrument Sans',
      splashColor: Colors.transparent,
      primaryColor: primaryColor,
      highlightColor: Colors.transparent,
      canvasColor: colorScheme.surface,
      indicatorColor: colorScheme.onPrimary,
      scaffoldBackgroundColor: AppColors.colorFAFAFA,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColors.color595959, size: 25),
        elevation: 0,
        centerTitle: false,
        color: colorScheme.surface,
        actionsIconTheme: const IconThemeData(color: AppColors.colorF5F5F5),
        titleTextStyle: _textTheme.titleLarge!.bold.size(22),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      textTheme: _textTheme,
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 2,
        helperMaxLines: 2,
        isDense: true,
        filled: true,
        suffixIconColor: AppColors.color434343,
        fillColor: Colors.white,
        labelStyle: _textTheme.bodyMedium!.regular.textColor8C8C8C,
        floatingLabelStyle: _textTheme.titleMedium!.textPrimary.regular,
        hintStyle: _textTheme.bodyMedium!.regular.textColor8C8C8C,
        helperStyle: _textTheme.bodySmall!.regular.textPrimary,
        focusedBorder: _inputBorder.copyWith(
            borderSide: BorderSide(
          color: colorScheme.primary,
        )),
        border: _inputBorder,
        enabledBorder: _inputBorder,
        errorBorder: _inputBorder.copyWith(
            borderSide: BorderSide(
          color: colorScheme.error,
        )),
        focusedErrorBorder: _inputBorder.copyWith(
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        disabledBorder: _inputBorder,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
      ),
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        color: primaryColor,
      ),
      dividerTheme: DividerThemeData(space: 24, color: Colors.grey.shade200, thickness: 1),
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
          disabledColor: Colors.grey.shade400),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          textStyle: _textTheme.titleMedium!.semiBold.textWhite.heightLine(0),
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xff7CA690),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: EdgeInsets.zero,
          textStyle: _textTheme.bodyLarge!.medium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: _textTheme.titleMedium!.semiBold.textPrimary.copyWith(height: 0),
          side: BorderSide(width: 1.5, color: colorScheme.primary),
          disabledForegroundColor: Colors.grey.shade400,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      colorScheme: colorScheme,
    );
  }

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontWeight: _bold,
      fontSize: 38.0,
      height: 46.0 / 38.0,
      color: AppColors.color1F1F1F,
    ),
    // Headline 4
    headlineMedium: TextStyle(
      fontWeight: _regular,
      fontSize: 34.0,
      height: 44.0 / 34.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.25,
    ),
    // Headline 5
    headlineSmall: TextStyle(
      fontWeight: _regular,
      fontSize: 24.0,
      height: 34.0 / 24.0,
      color: AppColors.color1F1F1F,
    ),
    // Headline 6
    titleLarge: TextStyle(
      fontWeight: _medium,
      fontSize: 20.0,
      height: 30.0 / 20.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.25,
    ),
    // Subtitle 1
    titleMedium: TextStyle(
      fontWeight: _semiBold,
      fontSize: 16.0,
      height: 26.0 / 16.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.15,
    ),
    // Subtitle 2
    titleSmall: TextStyle(
      fontWeight: _semiBold,
      fontSize: 14.0,
      height: 24.0 / 14.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.1,
    ),
    // Body 1
    bodyLarge: TextStyle(
      fontWeight: _regular,
      fontSize: 16.0,
      height: 26.0 / 16.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.25,
    ),
    // Body 2
    bodyMedium: TextStyle(
      fontWeight: _regular,
      fontSize: 14.0,
      height: 24.0 / 14.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.25,
    ),
    // Button
    labelLarge: TextStyle(
      fontWeight: _medium,
      fontSize: 14.0,
      height: 20.0 / 14.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.5,
    ),
    // Caption
    bodySmall: TextStyle(
      fontWeight: _regular,
      fontSize: 12.0,
      height: 20.0 / 12.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.4,
    ),
    // Overline
    labelSmall: TextStyle(
      fontWeight: _regular,
      fontSize: 10.0,
      height: 20.0 / 10.0,
      color: AppColors.color1F1F1F,
      letterSpacing: 0.15,
    ),
  );
}

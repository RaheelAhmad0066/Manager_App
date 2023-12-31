import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gerentea/core/utils/size_utils.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.green700,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.green700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray600,
          fontSize: 19.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray600,
          fontSize: 14.fSize,
          fontFamily: 'Actor',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray600,
          fontSize: 11.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 35.fSize,
          fontFamily: 'Itim',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray60001,
          fontSize: 30.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onError,
          fontSize: 27.fSize,
          fontFamily: 'Inder',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.green700,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.green700,
          fontSize: 13.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: appTheme.green700,
          fontSize: 11.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 23.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.green700,
          fontSize: 18.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.green700,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFF5F6F8),
    primaryContainer: Color(0XFF084A7D),
    secondary: Color(0XFF084A7D),
    secondaryContainer: Color(0XFFDDDDDD),
    tertiary: Color(0XFF084A7D),
    tertiaryContainer: Color(0XFFDDDDDD),

    // Background colors
    background: Color(0XFF084A7D),

    // Surface colors
    surface: Color(0XFF084A7D),
    surfaceTint: Color(0X1E2F2B43),
    surfaceVariant: Color(0XFFDDDDDD),

    // Error colors
    error: Color(0X1E2F2B43),
    errorContainer: Color(0XFFF09C07),
    onError: Color(0XFFE5FDFF),
    onErrorContainer: Color(0XFF222222),

    // On colors(text colors)
    onBackground: Color(0XFFFFFFFF),
    onInverseSurface: Color(0XFFE5FDFF),
    onPrimary: Color(0X1E2F2B43),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondary: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0X1E2F2B43),
    onTertiary: Color(0XFFFFFFFF),
    onTertiaryContainer: Color(0X1E2F2B43),

    // Other colors
    outline: Color(0X1E2F2B43),
    outlineVariant: Color(0XFF084A7D),
    scrim: Color(0XFF084A7D),
    shadow: Color(0X1E2F2B43),

    // Inverse colors
    inversePrimary: Color(0XFF084A7D),
    inverseSurface: Color(0X1E2F2B43),

    // Pending colors
    onSurface: Color(0XFFFFFFFF),
    onSurfaceVariant: Color(0X1E2F2B43),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blueA100 => Color(0XFF7DA8FA);

  // BlueGray
  Color get blueGray200 => Color(0XFFB2BAC5);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray800 => Color(0XFF194562);
  Color get blueGray900 => Color(0XFF333333);

  // Gray
  Color get gray400 => Color(0XFFBBBBBB);
  Color get gray600 => Color(0XFF6B6B6B);
  Color get gray60001 => Color(0XFF737373);
  Color get gray500 => Color(0XFF9E9E9E);
  Color get gray900 => Color(0XFF222222);
  // Green
  Color get green700 => Color(0XFF409835);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

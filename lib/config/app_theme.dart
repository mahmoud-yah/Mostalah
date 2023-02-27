import 'package:flutter/material.dart';

// LinearGradient appBarGradient = const LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: <Color>[Color(0xFFD8C4C4), Color(0xFFF15E90)],
// );
//
// LinearGradient bottomNavigationBarGradient = const LinearGradient(
//     begin: Alignment.bottomCenter,
//     end: Alignment.topCenter,
//     stops: [0.0, 0.001],
//     tileMode: TileMode.mirror,
//     colors: <Color>[Color(0xFFD8C4C4), Color(0xFFF15E90)]);
//
// LinearGradient buttonGradient = const LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   stops: [0.0, 0.7],
//   colors: <Color>[Color(0xFFD8C4C4), Color(0xFFF15E90)],
// );

class AppTheme {
  static const _primaryColorDark = Color(0xFFBB86FC);
  static const _primaryVariantDark = Color(0xFF3700B3);
  static const _secondaryColorDark = Color(0xFF03DAC6);
  static const _backgroundColorDark = Color(0xFF121212);
  static const _surfaceColorDark = Color(0xFF121212);
  static const _errorColorDark = Color(0xFFCF6679);
  static const _onPrimaryColorDark = Color(0xFF000000);
  static const _onSecondaryColorDark = Color(0xFF000000);
  static const _onBackgroundColorDark = Color(0xFFFFFFFF);
  static const _onSurfaceColorDark = Color(0xFFFFFFFF);
  static const _onErrorColorDark = Color(0xFF000000);

  static final light = ThemeData(
    primaryColor: const Color(0xFFF15E90),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.yellowAccent,
    ),
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
    // dividerColor: Colors.grey,
  );

  static final dark = ThemeData(
    // primaryColor: Colors.white,
    // backgroundColor: const Color(0xFF121212),
    // backgroundColor: Colors.redAccent,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: _primaryColorDark,
      primaryContainer: _primaryVariantDark,
      secondary: _secondaryColorDark,
      background: _backgroundColorDark,
      surface: _surfaceColorDark,
      error: _errorColorDark,
      onPrimary: _onPrimaryColorDark,
      onSecondary: _onSecondaryColorDark,
      onBackground: _onBackgroundColorDark,
      onSurface: _onSurfaceColorDark,
      onError: _onErrorColorDark,
    ),
    brightness: Brightness.dark,
    dividerColor: Colors.grey.shade900,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );

  static LinearGradient appBarGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xFFD8C4C4), Color(0xFFF15E90)],
  );

  static LinearGradient bottomNavigationBarGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.001],
      tileMode: TileMode.mirror,
      colors: <Color>[Color(0xFFD8C4C4), Color(0xFFF15E90)]);

  static LinearGradient buttonGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.7],
    colors: <Color>[Color(0xFFD8C4C4), Color(0xFFF15E90)],
  );

  static LinearGradient favoritesIconGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.red.shade900, Colors.pink.shade100]);

  static LinearGradient appBarGradientDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.purple, Colors.red.shade900],
  );

  static LinearGradient bottomNavigationBarGradientDark = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: const [0.0, 0.7],
    tileMode: TileMode.mirror,
    colors: <Color>[Colors.purple, Colors.red.shade900],
  );

  static LinearGradient buttonGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.0, 0.7],
    colors: <Color>[Colors.purple, Colors.red.shade900],
  );

  static LinearGradient favoritesIconGradientDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.purple, Colors.red.shade900]);
}

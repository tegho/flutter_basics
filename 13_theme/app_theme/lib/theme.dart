import 'package:flutter/material.dart';

// ThemeData _themeLight = ThemeData.light();
//
// ThemeData themeLight = _themeLight.copyWith(
//   textTheme: _textLight(_themeLight.textTheme),
// );
//
// TextTheme _textLight(TextTheme base) {
//   return base.copyWith();
// }

final _col1 = Colors.deepOrange[100];
final _col2 = Colors.black54;

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  textTheme: _textLight(_themeLight.textTheme),
  appBarTheme: _themeLight.appBarTheme.copyWith(
    color: _col2,
    foregroundColor: _col1,
  ),
  colorScheme: _themeLight.colorScheme.copyWith(
    primary: _col1,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
        letterSpacing: 0.2,
        fontWeight: FontWeight.w500,
      )),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      backgroundColor: MaterialStateProperty.all<Color>(_col1),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    ),
  ),
  progressIndicatorTheme: _themeLight.progressIndicatorTheme.copyWith(
    color: _col2,
  ),
  cardTheme: _themeLight.cardTheme.copyWith(
    color: _col1,
    elevation: 10,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    margin: EdgeInsets.all(10),
  ),
  bottomNavigationBarTheme: _themeLight.bottomNavigationBarTheme.copyWith(
    backgroundColor: _col2,
    elevation: 0,
  ),
  chipTheme: _themeLight.chipTheme.copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    selectedColor: _col1,
    backgroundColor: _col2,
    disabledColor: Colors.black26,
    showCheckmark: false,
    labelStyle: TextStyle(color: Colors.white),
  ),
  materialTapTargetSize: MaterialTapTargetSize.padded,
  primaryColorDark: _col1,

  // transparent for mouse hover and hit
  hoverColor: Colors.transparent,
  highlightColor: Colors.transparent,
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  /// Light theme
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueGrey.shade800,
      brightness: Brightness.light,
    ),
  );

  /// Dark theme
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueGrey.shade800,
      brightness: Brightness.dark,
    ),
  );
}

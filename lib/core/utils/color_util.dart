import 'package:flutter/material.dart';

class ColorUtil {
  // Logo Colors
  static const Color logoBlue = Color(0xFF11539D);
  static const Color logoGreen = Color(0xFF398200);

  // Gradient
  static const LinearGradient logoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [logoBlue, logoGreen],
  );

  // Common UI Colors
  static const Color accentOrange = Color(0xFFFF9800);
  static const Color lightBg = Color(0xFFF8F9FA);
  static const Color cardWhite = Colors.white;
  static const Color textDark = Color(0xFF2D3436);
  static const Color textGrey = Color(0xFF636E72);
  static const Color errorRed = Color(0xFFD63031);
  static const Color successGreen = Color(0xFF27AE60);

  // Theme Helpers
  static Color primary(BuildContext context) => Theme.of(context).primaryColor;
  static Color secondary(BuildContext context) => Theme.of(context).colorScheme.secondary;
}

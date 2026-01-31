// lib/core/constants/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryGreen = Color(0xFF4CAF50);       // Main green
  static const primaryGreenDark = Color(0xFF388E3C);
  static const accentOrange = Color(0xFFFF9800);       // Donate / Urgent button
  static const accentRed = Color(0xFFE53935);          // Emergency notice
  static const lightBg = Color(0xFFF5F5F5);
  static const cardWhite = Colors.white;
  static const textDark = Color(0xFF212121);
  static const textGrey = Color(0xFF757575);
  static const divider = Color(0xFFE0E0E0);

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryGreen,
      scaffoldBackgroundColor: lightBg,
      colorScheme: ColorScheme.light(
        primary: primaryGreen,
        secondary: accentOrange,
        error: accentRed,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
      textTheme: GoogleFonts.notoSansBengaliTextTheme(
        Theme.of(context).textTheme,
      ).copyWith(
        headlineMedium: GoogleFonts.notoSansBengali(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        titleLarge: GoogleFonts.notoSansBengali(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        bodyLarge: GoogleFonts.notoSansBengali(fontSize: 16, color: textDark),
        bodyMedium: GoogleFonts.notoSansBengali(fontSize: 14, color: textGrey),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: cardWhite,
      ),
    );
  }
}
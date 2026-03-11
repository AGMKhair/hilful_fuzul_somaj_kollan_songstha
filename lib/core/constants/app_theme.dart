import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors from Logo
  static const Color primaryBlue = Color(0xFF11539D);   // Correct Blue from logo
  static const Color primaryGreen = Color(0xFF398200);  // Correct Green from logo
  
  static const Color accentOrange = Color(0xFFFF9800);  // For CTA/Donate
  static const Color lightBg = Color(0xFFF8F9FA);
  static const Color cardWhite = Colors.white;
  static const Color textDark = Color(0xFF2D3436);
  static const Color textGrey = Color(0xFF636E72);
  static const Color errorRed = Color(0xFFD63031);
  static const Color successGreen = Color(0xFF27AE60);

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryBlue,
      colorScheme: ColorScheme.light(
        primary: primaryBlue,
        secondary: primaryGreen,
        surface: cardWhite,
        error: errorRed,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textDark,
      ),
      scaffoldBackgroundColor: lightBg,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryBlue,
        unselectedItemColor: textGrey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: primaryBlue,
        unselectedLabelColor: textGrey,
        indicatorColor: primaryBlue,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
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
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: cardWhite,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tickets/config/app_colors.dart'; // <-- IMPORT FILE MÀU

// === LIGHT THEME ===
final ThemeData lightTheme = ThemeData.from(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightAppBar,
    onPrimary: Colors.white,
    secondary: AppColors.primaryAccent,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightText,
  ),
  useMaterial3: true,
).copyWith(
  scaffoldBackgroundColor: AppColors.lightBackground,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: AppColors.darkBackground),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkBackground, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    // ... các style khác
  ),
  // ... các theme khác
);

// === DARK THEME ===
final ThemeData darkTheme = ThemeData.from(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryAccent,
    onPrimary: Colors.white,
    secondary: AppColors.primaryAccent,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkText,
  ),
  useMaterial3: true,
).copyWith(
  scaffoldBackgroundColor: AppColors.darkBackground,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: AppColors.lightBackground),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightBackground, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    // ... các style khác
  ),
  // ... các theme khác
);

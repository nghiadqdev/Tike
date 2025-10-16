import 'package:flutter/material.dart';

class AppColors {
  // Ngăn không cho class này được khởi tạo
  AppColors._();

  // === MÀU SẮC CHUNG ===
  static const Color primaryAccent = Color(0xFFF50057);

  // === MÀU CHO LIGHT THEME ===
  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Colors.white;
  static const Color lightAppBar = Color(0xFF1E1E1E);
  static const Color lightText = Color(0xFF121212);

  // === MÀU CHO DARK THEME ===
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFE0E0E0);
}
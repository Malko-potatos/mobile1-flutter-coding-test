import 'package:flutter/material.dart';

/// Rsupport Design System (RDS) 테마 정의
///
/// 알서포트의 기업 아이덴티티인 "신뢰(Blue/Navy)"와 "연결/에너지(Orange)"를
/// 핵심 키워드로 하는 전문적인 업무 도구 디자인 시스템입니다.
class AppTheme {
  AppTheme._();

  // 1. Color Palette Definitions
  static const Color rsupportOrange = Color(0xFFF37321); // Primary - 에너지, 강조
  static const Color rsupportNavy = Color(0xFF1A2B4C); // Secondary - 신뢰, 전문성
  static const Color backgroundGray =
      Color(0xFFF5F7FA); // Background - 눈의 피로 감소
  static const Color surfaceWhite = Color(0xFFFFFFFF); // Surface - 깔끔함
  static const Color errorRed = Color(0xFFE02020); // Error - 경고, 종료
  static const Color successGreen = Color(0xFF28A745); // Success - 연결 성공
  static const Color textDark = Color(0xFF212529); // Text - 다크
  static const Color textGray = Color(0xFF868E96); // Text - 그레이

  // 2. Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: rsupportOrange,
        onPrimary: Colors.white,
        secondary: rsupportNavy,
        onSecondary: Colors.white,
        surface: surfaceWhite,
        background: backgroundGray,
        error: errorRed,
      ),

      // Scaffold Background
      scaffoldBackgroundColor: backgroundGray,

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: rsupportNavy,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: rsupportOrange,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Outline Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: rsupportNavy,
          side: const BorderSide(color: rsupportNavy),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceWhite,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDEE2E6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDEE2E6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: rsupportOrange, width: 2),
        ),
        labelStyle: const TextStyle(color: textGray),
        hintStyle: TextStyle(color: textGray.withOpacity(0.5)),
      ),

      // Text Theme
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: rsupportNavy,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: textDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: textDark,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: textGray,
          fontSize: 14,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: surfaceWhite,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

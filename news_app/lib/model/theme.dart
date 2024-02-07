import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeService {
  ThemeService._private();
  static final _shared = ThemeService._private();
  factory ThemeService() => _shared;
  ThemeData dark() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      primaryIconTheme: const IconThemeData(
        size: 34,
        color: Colors.green,
      ),
      indicatorColor: Colors.black,
      highlightColor: Colors.white,
      radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll(Colors.white),
      ),
      textTheme: TextTheme(
        displaySmall: TextStyle(
            fontSize: 26.sp,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white60),
        headlineMedium: TextStyle(
          fontSize: 20.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
            fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.black),
        labelLarge: TextStyle(
            fontSize: 17.sp,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        labelSmall: TextStyle(
          fontSize: 16.sp,
          color: Colors.white54,
        ),
        labelMedium: TextStyle(
          fontSize: 17.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 19.sp,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(
            fontSize: 17.sp,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 17.sp,
          color: Colors.white54,
          fontWeight: FontWeight.w500,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.white38,
        endIndent: 55,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.grey.shade900,
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: Colors.white, size: 28),
      appBarTheme: AppBarTheme(
          actionsIconTheme: const IconThemeData(color: Colors.white, size: 26),
          color: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 26),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.sp)),
    );
  }

  ThemeData light() {
    return ThemeData.light(useMaterial3: true).copyWith(
      primaryIconTheme: const IconThemeData(
        size: 34,
        color: Colors.green,
      ),
      indicatorColor: Colors.white10,
      highlightColor: Colors.black,
      radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll(Colors.black),
      ),
      textTheme: TextTheme(
          displaySmall: TextStyle(
              fontSize: 26.sp,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
          headlineMedium: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          labelLarge: TextStyle(
              fontSize: 17.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
          labelSmall: TextStyle(
            fontSize: 16.sp,
            color: Colors.black54,
          ),
          labelMedium: TextStyle(
            fontSize: 17.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
              color: Colors.black,
              fontSize: 19.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              fontSize: 17.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 17.sp,
              color: Colors.black45,
              fontWeight: FontWeight.w500)),
      dividerTheme: const DividerThemeData(
        color: Colors.black26,
        endIndent: 55,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.grey.shade100,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.black, size: 28),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          actionsIconTheme: const IconThemeData(color: Colors.black, size: 26),
          iconTheme: const IconThemeData(color: Colors.black, size: 26),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18.sp)),
    );
  }
}

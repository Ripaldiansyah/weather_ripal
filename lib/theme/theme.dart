import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

ThemeData getCustomeTheme() {
  return ThemeData().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontFamily: "SF Pro Display",
        fontSize: 18,
        color: Colors.white,
      ),
      backgroundColor: scaffoldBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      backgroundColor: primaryColor,
      selectedItemColor: Color(0xffc427fb),
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
    ),
    iconTheme: IconThemeData(color: iconColor),
    textTheme: TextTheme(
      titleSmall: TextStyle(fontFamily: "SF Pro Display", color: textColor),
      titleMedium: TextStyle(fontFamily: "SF Pro Display", color: textColor),
      titleLarge: TextStyle(
        fontFamily: "SF Pro Display",
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(fontFamily: "SF Pro Display", color: textColor),
      bodySmall: TextStyle(fontFamily: "SF Pro Display", color: textColor),
      bodyMedium: TextStyle(fontFamily: "SF Pro Display", color: textColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: componentColor,
      filled: true,
      hintStyle: TextStyle(
        fontFamily: "SF Pro Display",
        fontSize: 14,
        color: Colors.white.withAlpha(160),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        borderSide: BorderSide(color: Color(0xffefefef), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.2),
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.2),
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.2),
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(width: 0.4, color: Colors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        // shadowColor: Colors.black.withAlpha(100),
        backgroundColor: componentColor,
        elevation: 2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ),
  );
}

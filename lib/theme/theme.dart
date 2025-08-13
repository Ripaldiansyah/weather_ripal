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
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: scaffoldBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.black),
      actionsIconTheme: const IconThemeData(color: Colors.black),
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
      selectedItemColor: primaryColor,
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
    ),
    iconTheme: IconThemeData(color: iconColor),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.roboto(color: textColor),
      titleMedium: GoogleFonts.roboto(color: textColor),
      titleLarge: GoogleFonts.roboto(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(color: textColor),
      bodySmall: GoogleFonts.roboto(color: textColor),
      bodyMedium: GoogleFonts.roboto(color: textColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xffefefef),
      filled: true,
      hintStyle: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        borderSide: BorderSide(color: Color(0xffefefef), width: 1.2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        borderSide: BorderSide(color: Color(0xffefefef), width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.2),
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
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ),
    dataTableTheme: DataTableThemeData(
      dataTextStyle: TextStyle(color: textColor),
      headingRowColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Colors.grey[200]!;
        }
        return Colors.grey[300]!;
      }),
      headingTextStyle: const TextStyle(),
      dataRowColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Colors.grey[200]!;
        }
        return Colors.white;
      }),
      dataRowMinHeight: 48,
    ),
  );
}

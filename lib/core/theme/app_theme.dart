import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
      brightness: Brightness.light,
      surface: Colors.grey.shade50,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    
    // ERROR FIX: CardTheme wala section hata diya hai taaki build pass ho jaye.
    // Default card style abhi ke liye kaafi hai.
    
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
    ),
  );
}


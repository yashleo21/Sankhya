import 'package:desi_helper/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Desi",
      theme: _buildTheme(Brightness.dark),
      home: HomeScreen(),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 147, 229, 250),
        brightness: brightness,
        surface: const Color.fromARGB(255, 42, 51, 59),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme)
  );
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clubhouse UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF2F0E4)),
        scaffoldBackgroundColor: Color(0xFFF2F0E4),
        primaryColor: Colors.white,
        accentColor: Color(0xFF27AE61),
        iconTheme: IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
        ),

      home: HomeScreen(),
    );
  }
}

import 'package:commutix/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          // textTheme: GoogleFonts.poppins(
          //   // Theme.of(context).textTheme,
          // ),
        ),
        home: HomePage(),
      )
  );
}
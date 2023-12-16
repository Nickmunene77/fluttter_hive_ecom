import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double size, Color color, FontWeight fontW) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: fontW);
}

TextStyle appStyleHeight(
    double size, Color color, FontWeight fontW, double heit) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontW, height: heit);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText(String text, double d){
  return Text('$text', style : GoogleFonts.openSans(fontSize: d, fontWeight: FontWeight.bold));
}

Widget customText2(String text, double d, Color color){
  return Text('$text', style : GoogleFonts.openSans(fontSize: d, fontWeight: FontWeight.bold, color: color));
}
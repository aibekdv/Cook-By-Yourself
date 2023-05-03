import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/core/values/primary_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primarySwatch: greenPrimary,
    fontFamily: GoogleFonts.poppins().fontFamily ?? 'Poppins',
    buttonColor: yellowColor,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

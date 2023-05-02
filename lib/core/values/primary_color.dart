import 'package:flutter/material.dart';

const MaterialColor greenPrimary =
    MaterialColor(_greenPrimaryPrimaryValue, <int, Color>{
  50: Color(0xFFECF1E1),
  100: Color(0xFFD0DDB3),
  200: Color(0xFFB0C681),
  300: Color(0xFF90AF4F),
  400: Color(0xFF799D29),
  500: Color(_greenPrimaryPrimaryValue),
  600: Color(0xFF598403),
  700: Color(0xFF4F7902),
  800: Color(0xFF456F02),
  900: Color(0xFF335C01),
});

const int _greenPrimaryPrimaryValue = 0xFF618C03;

const MaterialColor greenPrimaryAccent =
    MaterialColor(_greenPrimaryAccentValue, <int, Color>{
  100: Color(0xFFC3FF8D),
  200: Color(_greenPrimaryAccentValue),
  400: Color(0xFF8DFF27),
  700: Color(0xFF80FF0E),
});

const int _greenPrimaryAccentValue = 0xFFA8FF5A;

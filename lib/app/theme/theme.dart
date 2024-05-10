import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/app/theme/colors.dart';

final kDefaultFontFamily = GoogleFonts.getFont('Poppins').fontFamily;

final theme = ThemeData(
  primaryColor: kDefaultOrange,
  useMaterial3: true,
  fontFamily: kDefaultFontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: kDefaultGrey,
      size: 30,
    ),
    actionsIconTheme: IconThemeData(
      color: kDefaultGrey,
      size: 30,
    ),
  ),
);

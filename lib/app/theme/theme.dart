import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/app/theme/colors.dart';

final kDefaultFontFamily = GoogleFonts.getFont('Poppins').fontFamily;

const kDefaultLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.1, 0.2, 0.5, 0.7],
  colors: [
    kDefaultWhite,
    kDefaultWhite,
    kLightOrange,
    kLightOrange,
  ],
);

final theme = ThemeData(
  primaryColor: kDefaultOrange,
  useMaterial3: true,
  fontFamily: kDefaultFontFamily,
  scaffoldBackgroundColor: Colors.transparent,
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

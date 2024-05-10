import 'package:flutter/material.dart';

const kDefaultOrange = Color(0xFFFC9E12);
const kLightOrange = Color(0xFFFAD7AF);
const kDefaultGrey = Color(0xFFA5957E);
const kDefaultBlack = Color(0xFF232220);
const kDefaultWhite = Color(0xFFFFFFFF);
const kLightGrey = Color(0xFF7A7A7A);

MaterialColor primarySwatch() {
  final shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900].asMap().map(
        (key, value) => MapEntry(
          value,
          kDefaultOrange.withOpacity(
            1 - (1 - (key + 1) / 10),
          ),
        ),
      );

  return MaterialColor(0xFFFC9E12, shades);
}

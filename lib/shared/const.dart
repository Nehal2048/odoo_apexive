import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color backgroundDarkColor = Color(0xFF0C1D4D);
const Color backgroundLightColor = Color(0xFF214ECC);
const Color white = Color(0xFFFFFFFF);

const List<Color> surfaceColors = [
  Color(0xFF0C1D4D),
  Color(0x29FFFFFF),
  Color(0x3DFFFFFF),
  Color(0x52FFFFFF),
  Color(0x7AFFFFFF),
];

LinearGradient backgroundGradient = const LinearGradient(
  colors: [backgroundDarkColor, backgroundLightColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const double defaultMarginValue = 16.0;
const double defaultSpacing = 16.0;
const double defaultGap = 8.0;
const double defaultRadius = 8.0;
const double defaultRadiusButtons = 12.0;
const double defaultButtonHeight = 48.0;

const Color projectColorWhite = white;
const Color projectColorGreen = Color(0xFF4CAF50);
const Color projectColorRed = Color(0xFFE53935);
const Color projectColorYellow = Color(0xFFFFEB3B);
const Color projectColorOrange = Color(0xFFFF9800);
const Color projectColorLightBlue = Color(0xFF03A9F4);
const Color projectColorMediumBlue = Color(0xFF2962FF);
const Color projectColorDarkBlue = Color(0xFF0D47A1);
const Color projectColorPurple = Color(0xFF9C27B0);
const Color projectColorDarkPurple = Color(0xFF311B92);
const Color projectColorFushia = Color(0xFFE91E63);
const Color projectColorSalmonPink = Color(0xFFE57373);

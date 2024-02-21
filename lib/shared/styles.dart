import 'package:flutter/material.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/theme.dart';

ButtonStyle appBarActionButtonFilledStyle = ButtonStyle(
  iconColor: MaterialStateProperty.all(white),
  backgroundColor: MaterialStateProperty.all(
    themeLightColorScheme.secondaryContainer,
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),
);

BoxDecoration defaultContainerBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: surfaceColors[1],
);

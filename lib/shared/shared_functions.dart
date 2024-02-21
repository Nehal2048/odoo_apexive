import 'package:flutter/material.dart';
import 'package:odoo_apexive/shared/widgets.dart';

showLoaderDialog(BuildContext context, bool? dismissable) {
  showDialog(
    barrierDismissible: dismissable ?? false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 300,
          padding: const EdgeInsets.all(15),
          child: const Loading(),
        ),
      );
    },
  );
}

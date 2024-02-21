import 'package:flutter/material.dart';
import 'package:odoo_apexive/shared/const.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }
}

class ErrorWidgetCustom extends StatelessWidget {
  const ErrorWidgetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ran into an error"),
    );
  }
}

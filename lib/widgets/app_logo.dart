import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120,
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}

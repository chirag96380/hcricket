import 'package:flutter/material.dart';
import 'package:hcricket/services/services_exports.dart';


class SplashServices {
  void splashScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.Onboarding,
        (route) => false,
      );
    });
  }
}

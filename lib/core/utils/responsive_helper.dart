import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && 
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double getWidth(BuildContext context) {
    if (isDesktop(context)) {
      return MediaQuery.of(context).size.width * 0.6;
    } else if (isTablet(context)) {
      return MediaQuery.of(context).size.width * 0.8;
    }
    return MediaQuery.of(context).size.width;
  }
} 
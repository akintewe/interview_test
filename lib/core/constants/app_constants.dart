import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF0052CC);
  static const Color secondary = Color(0xFF666666);
  static const Color background = Color(0xFFFFFFFF);
  static const Color searchBackground = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color divider = Color(0xFFEEEEEE);
   static const Color chipBackground = Color(0xFFF3F6FF);
   static Color headerIconBackground = Color.fromRGBO(248, 248, 248, 1);
  static const Color chipSelectedBackground = Color(0xFF0052CC);
}

class AppTextStyles {
  static final heading = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.24,
    color: AppColors.textPrimary,
  );
  
  static final title = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.60,
    color: AppColors.textPrimary,
  );
  
  static final subtitle = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.24,
    color: AppColors.textSecondary,
  );
   static final chipLabel = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

   static final searchHint = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  
  static final timeText = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.24,
    color: AppColors.primary,
  );
}

class AppSizes {
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  
  static const double radiusS = 10.0;
  static const double radiusM = 16.0;
  static const double radiusL = 24.0;
  static const double radiusXL = 30.0;
  
  static const double iconSize = 24.0;
  static const double avatarSize = 40.0;
} 
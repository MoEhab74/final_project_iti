import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle primaryHeadLinesStyle = TextStyle(
    fontFamily: AppFonts.mainAppFont,
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurfaceColor,
  );

  static TextStyle subTitlesStyle = TextStyle(
    fontFamily: AppFonts.mainAppFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor
  );

  static TextStyle bodyBlackStyle = TextStyle(
    fontFamily: AppFonts.mainAppFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurfaceColor,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle bodyGrayStyle = TextStyle(
    fontFamily: AppFonts.mainAppFont,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.grayColor,
  );

  static TextStyle bodySmallGrayStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff9CA4AB),
  );

  static TextStyle informationBodyStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff1F2C37),
  );
  static TextStyle cartTitleStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static TextStyle discriptionStyle = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 16.sp,
    height: 1.5,
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
  );
  static TextStyle errorTextStyle = TextStyle(
    fontFamily: AppFonts.mainAppFont,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );
}

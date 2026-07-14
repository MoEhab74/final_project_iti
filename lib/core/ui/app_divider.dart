import 'package:final_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key, this.thickness, this.indent, this.endIndent, this.color,
  });
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1.h,
      color: color ?? AppColors.secondaryColor.withValues(alpha: 0.3),
      indent: indent ?? 0,
      endIndent: endIndent ?? 0,
    );
  }
}
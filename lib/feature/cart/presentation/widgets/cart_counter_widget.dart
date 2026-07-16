// Add count for the CartCounterWidget to get it from API response
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';

class CartCounterWidget extends StatefulWidget {
  const CartCounterWidget({super.key});

  @override
  State<CartCounterWidget> createState() => _CartCounterWidgetState();
}

class _CartCounterWidgetState extends State<CartCounterWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32.h,
          width: 32.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.grayColor),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              if (count > 1) {
                setState(() => count--);
              }
            },
            icon: Icon(Icons.remove, size: 18.sp),
          ),
        ),
        SizedBox(width: 8.w),
        Text('$count', style: AppStyles.bodyBlackStyle),
        SizedBox(width: 8.w),
        Container(
          height: 32.h,
          width: 32.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.grayColor),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              setState(() => count++);
            },
            icon: Icon(Icons.add, size: 18.sp),
          ),
        ),
      ],
    );
  }
}

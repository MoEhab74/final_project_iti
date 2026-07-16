import 'package:final_project/feature/home/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogOutButtom extends StatelessWidget {
  const LogOutButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showLogoutDialog(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 8.w),
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        alignment: Alignment.centerLeft,
        height: 48.h,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.logout, color: Colors.red, size: 24.w),
            SizedBox(width: 8.w),
            Text(
              'Log Out',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
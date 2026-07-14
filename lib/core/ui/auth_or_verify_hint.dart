import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationOrVerificationHint extends StatelessWidget {
  const AuthenticationOrVerificationHint({
    super.key,
    required this.questionText,
    required this.actionText,
    this.onTap,
  });
  final String questionText;
  final String actionText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.end,
      TextSpan(
        children: [
          TextSpan(
            text: questionText,
            style: TextStyle(
              // color: AppColors.primaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: actionText,
            style: TextStyle(
              // color: AppColors.onSurfaceColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

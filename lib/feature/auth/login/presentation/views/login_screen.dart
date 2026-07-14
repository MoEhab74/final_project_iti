import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/hight_or_width_space.dart';
import 'package:final_project/feature/auth/login/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ).w.copyWith(bottom: 10).h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const HightOrWidthSpace(height: 56.0),
            Image.asset(
              'assets/images/image.png',
              width: 331.w,
              height: 135,
            ),
            const HightOrWidthSpace(height: 62.0),
            const LoginForm(),
          ],
        ),
      ),
    ),
        );
  }
}


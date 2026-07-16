import 'package:final_project/core/ui/hight_or_width_space.dart';
import 'package:final_project/feature/auth/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              const HightOrWidthSpace(height: 56),
              Image.asset(
                'assets/images/image.png',
                width: 331.w,
                height: 135.h,
              ),
              const SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

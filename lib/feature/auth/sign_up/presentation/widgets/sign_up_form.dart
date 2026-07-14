import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/auth_or_verify_hint.dart';
import 'package:final_project/core/ui/hight_or_width_space.dart';
import 'package:final_project/core/ui/primary_button_widget.dart';
import 'package:final_project/core/ui/primary_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HightOrWidthSpace(height: 32.0),
          Text('Full Name', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 8.0),
          AppTextFormField(
            hintText: 'Enter your full name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          const HightOrWidthSpace(height: 16.0),
          Text('User Name', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 8.0),
          AppTextFormField(
            hintText: 'Enter your user name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
          ),
          const HightOrWidthSpace(height: 16.0),
          Text('Password', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 8.0),
          AppTextFormField(
            hintText: 'Enter your password',
            obscureText: true,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const HightOrWidthSpace(height: 16.0),
          Text('Confirm Password', style: AppStyles.bodyBlackStyle),
         const HightOrWidthSpace(height: 8.0),
          AppTextFormField(
            hintText: 'Re-enter your password',
            obscureText: true,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              return null;
            },
          ),
          const HightOrWidthSpace(height: 55.0),
          Center(
            child: AppButton(
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                // Handle login action
                if (_formKey.currentState!.validate()) {
                  // Login logic here from the cubit or bloc
                }
              },
              text: 'Login',
            ),
          ),
          const HightOrWidthSpace(height: 100),
          Center(
            child: AuthenticationOrVerificationHint(
              questionText: 'Already have an account? ',
              actionText: 'Login',
              onTap: () {
                // Handle sign up action
                GoRouter.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

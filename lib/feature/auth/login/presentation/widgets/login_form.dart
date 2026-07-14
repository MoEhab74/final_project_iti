import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:final_project/core/routing/app_routes.dart';
import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/auth_or_verify_hint.dart';
import 'package:final_project/core/ui/hight_or_width_space.dart';
import 'package:final_project/core/ui/loading_lottie.dart';
import 'package:final_project/core/ui/primary_button_widget.dart';
import 'package:final_project/core/ui/primary_text_form_field.dart';
import 'package:final_project/core/utils/animated_snack_bar.dart';
import 'package:final_project/feature/auth/cubit/auth_cubit.dart';
import 'package:final_project/feature/auth/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter your name', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 8.0),
          AppTextFormField(
            controller: _emailController,
            hintText: 'User name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
          ),
          const HightOrWidthSpace(height: 16.0),
          Text('Password', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 4.0),
          AppTextFormField(
            controller: _passwordController,
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
          const HightOrWidthSpace(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me check buttom
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    checkColor: AppColors.whiteColor,
                    fillColor: WidgetStateColor.resolveWith((states) {
                      return AppColors.primaryColor;
                    }),
                    value: true,
                    onChanged: (value) {
                      setState(() {
                        // _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Remember me'),
                ],
              ),
              Text('Forget your password?', style:AppStyles.subTitlesStyle.copyWith(
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blackColor,

              )),
            ],
          ),
          const HightOrWidthSpace(height: 55.0),
          BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              // Here i'll handle the states for showing snackbars or navigation
              if (state is AuthFailureState) {
                showAnimatedSnackbar(
                  context,
                  message: state.errorMessage,
                  type: AnimatedSnackBarType.error,
                );
              } else if (state is AuthSuccessState) {
                showAnimatedSnackbar(
                  context,
                  message: 'Login Successful',
                  type: AnimatedSnackBarType.success,
                );
                // Navigate to home screen
                GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
              }
            },
            builder: (context, state) {
              // Different builder based on state
              if (state is AuthLoadingState) {
                return const Center(child: LoadingLottie());
              }
              return Center(
                child: AppButton(
                  text: 'Login',
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    // Handle login action
                    if (_formKey.currentState!.validate()) {
                      // Login logic here from the cubit or bloc
                      // Don't forget to replace with actual user inputs
                      context.read<AuthCubit>().login(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                    }
                  },
                ),
              );
            },
          ),
          const HightOrWidthSpace(height: 12),
          Center(
            child: AuthenticationOrVerificationHint(
              questionText: 'Don\'t have an account? ',
              actionText: 'Join',
              onTap: () {
                // Handle sign up action
                GoRouter.of(context).push(AppRoutes.signUpScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}

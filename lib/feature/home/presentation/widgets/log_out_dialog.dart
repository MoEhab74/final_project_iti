import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:final_project/core/routing/app_routes.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/loading_lottie.dart';
import 'package:final_project/core/ui/primary_button_widget.dart';
import 'package:final_project/core/utils/animated_snack_bar.dart';
import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/auth/cubit/auth_cubit.dart';
import 'package:final_project/feature/auth/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return BlocProvider.value(
        value: locator<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthLoggedOutState) {
              Navigator.pop(context);

              showAnimatedSnackbar(
                context,
                message: 'Logged out successfully',
                type: AnimatedSnackBarType.success,
              );

              GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoadingState;

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 72.w,
                      height: 72.w,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                        size: 34.sp,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      "Log Out",
                      style: AppStyles.primaryHeadLinesStyle,
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Are you sure you want to log out?\nYou'll need to sign in again.",
                      textAlign: TextAlign.center,
                      style: AppStyles.subTitlesStyle,
                    ),

                    SizedBox(height: 28.h),

                    if (isLoading)
                      const LoadingLottie()
                    else
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              text: "Cancel",
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: AppButton(
                              text: "Log Out",
                              color: Colors.red,
                              onPressed: () {
                                context.read<AuthCubit>().logOut();
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

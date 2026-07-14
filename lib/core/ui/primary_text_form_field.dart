import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.prefix,
    this.width,
    this.height,
    this.isPassword,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.controller,
  });

  final String? hintText;
  final String? prefix;
  final double? width;
  final double? height;
  final bool? isPassword;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 331.w,
      height: widget.height ?? 56.h,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: isObscured,
        decoration: InputDecoration(
          prefixIcon: widget.prefix != null
              ? Padding(
                  padding: const EdgeInsets.all(14),
                  child: Image.asset(widget.prefix!, width: 22, height: 22),
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 50,
            minHeight: 50,
          ),
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.hintTextColor,
                    size: 22,
                  ),
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: const BorderSide(color: AppColors.borderGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: Colors.red),
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
          hintText: widget.hintText ?? "Enter text",
          hintStyle: AppStyles.buttonTextStyle.copyWith(
            color: AppColors.hintTextColor,
          ),
        ),
      ),
    );
  }
}
import 'package:final_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    super.key,
    required this.title,
    required this.titleTextButton,
  });

  final String title;
  final String titleTextButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.onSurfaceColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            titleTextButton,
            style: TextStyle(
              color: Color(0xff6055D8),
              fontSize: 21,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
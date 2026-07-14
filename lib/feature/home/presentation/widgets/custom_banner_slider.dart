import 'package:final_project/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomBannerSlider extends StatefulWidget {
  const CustomBannerSlider({super.key});

  @override
  State<CustomBannerSlider> createState() => _CustomBannerSliderState();
}

class _CustomBannerSliderState extends State<CustomBannerSlider> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            padEnds: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    "assets/images/image.png",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: WormEffect(
            activeDotColor: AppColors.primaryColor,
            dotColor: AppColors.grayColor,
            dotHeight: 8.h,
            dotWidth: 8.w,
            spacing: 4.w,
          ),
        ),
      ],
    );
  }
}

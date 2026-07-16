import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/ui/primary_text_form_field.dart';
import 'package:final_project/feature/home/presentation/widgets/custom_banner_slider.dart';
import 'package:final_project/feature/home/presentation/widgets/see_all_widget.dart';
import 'package:final_project/feature/home/presentation/widgets/shop_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Icon(
                    Icons.person,
                    size: 50.sp,
                    color: AppColors.grayColor,
                  ),
                ),
                SizedBox(width: 12.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello!",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onSurfaceColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Mohamed Ehab",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurfaceColor,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 28.sp,
                    color: AppColors.grayColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            /// Search
            Center(
              child: AppTextFormField(
                hintText: "Search here",
                prefix: "assets/images/search.png",
              ),
            ),
            SizedBox(height: 16.h),

            /// Banner
            CustomBannerSlider(),

            SizedBox(height: 8.h),

            /// Featured
            const SeeAllWidget(title: "Featured", titleTextButton: "See All"),

            const ShopBuilder(heroTagPrefix: 'featured_'),

            SizedBox(height: 12.h),

            /// Most Popular
            const SeeAllWidget(
              title: "Most Popular",
              titleTextButton: "See All",
            ),

            const ShopBuilder(heroTagPrefix: 'popular_'),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/feature/cart/presentation/widgets/cart_counter_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.quantity,
  });
  final String title;
  final double price;
  final String thumbnail;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grayColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: thumbnail,
              width: 100.w,
              height: 100.h,
              errorWidget: (context, url, error) {
                return Image.asset(
                  'assets/images/logo.png',
                  width: 100.w,
                  height: 100.h,
                );
              },
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppStyles.cartTitleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.delete, color: Colors.red, size: 20.sp),
                  ],
                ),
                SizedBox(height: 6.h),
                Text("Size L", style: AppStyles.subTitlesStyle),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(price.toString(), style: AppStyles.subTitlesStyle),
                    const Spacer(),

                    CartCounterWidget(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
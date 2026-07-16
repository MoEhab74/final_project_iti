import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/primary_button_widget.dart';
import 'package:final_project/feature/home/data/models/product_model.dart';
import 'package:final_project/feature/home/presentation/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),
                  Hero(
                    tag: product.id ?? "1234",
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 370.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),

                              image: DecorationImage(
                                image:
                                    product.images?.isNotEmpty == true &&
                                        product.images!.first.isNotEmpty
                                    ? CachedNetworkImageProvider(
                                        product.images!.first,
                                      )
                                    : const AssetImage(
                                            'assets/images/image.png',
                                          )
                                          as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            top: 18.h,
                            left: 18.w,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              borderRadius: BorderRadius.circular(50.r),
                              child: Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 32.sp,
                                  color: AppColors.onSurfaceColor,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 18.h,
                            right: 18.w,
                            child: Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: HeartWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title ?? "No title",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.onSurfaceColor,
                          ),
                        ),
                      ),
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff6055D8),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20.sp),
                      SizedBox(width: 5.w),
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "(20 Review)",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurfaceColor,
                    ),
                  ),
                  SelectableText(
                    product.description ?? "No Describtion",
                    style: AppStyles.discriptionStyle,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h),

          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Size",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              _sizeItem("8", true),
              SizedBox(width: 10.w),
              _sizeItem("10", false),
              SizedBox(width: 10.w),
              _sizeItem("38", false),
              SizedBox(width: 10.w),
              _sizeItem("40", false),
            ],
          ),
          Divider(color: Colors.grey[300], thickness: 1),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ).copyWith(top: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: AppButton(
                    color: Color(0xff6055D8),
                    text: "Buy Now",
                    onPressed: () {
                      AnimatedSnackBar.material(
                        "Added to cart successfully",
                        type: AnimatedSnackBarType.success,
                      ).show(context);
                    },
                  ),
                ),
                SizedBox(width: 80.w),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Icon(Icons.shopping_bag, size: 40),
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _sizeItem(String size, bool selected) {
  return Container(
    height: 45.h,
    width: 45.w,
    decoration: BoxDecoration(
      color: selected ? const Color(0xff6055D8) : Colors.white,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Center(
      child: Text(
        size,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

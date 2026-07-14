import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/ui/loading_lottie.dart';
import 'package:final_project/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.onTap,
    required this.product,
  });

  final VoidCallback? onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: SizedBox(
        width: 155.w,
        child: Card(
          color: Colors.white,
          elevation: 2,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: product.id ?? "12345",
                        child: product.images?.isNotEmpty == true &&
                                product.images!.first.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: product.images!.first,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const Center(child: LoadingLottie()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : const Center(
                                child: Icon(Icons.article),
                              ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 18,
                        onPressed: () {
                          // Favorite Action
                        },
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  product.title ?? "No title",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
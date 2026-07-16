import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/ui/loading_lottie.dart';
import 'package:final_project/feature/home/data/models/product_model.dart';
import 'package:final_project/feature/home/presentation/views/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.onTap,
    required this.product,
    this.heroTagPrefix = '',
  });

  final VoidCallback? onTap;
  final ProductModel product;
  final String heroTagPrefix;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  product: product,
                ),
              ),
            );
          },
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
                        tag: '$heroTagPrefix${product.id ?? "12345"}',
                        child:
                            product.images?.isNotEmpty == true &&
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
                      child: HeartWidget(),
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

class HeartWidget extends StatefulWidget {
  const HeartWidget({
    super.key,
  });

  @override
  State<HeartWidget> createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      iconSize: 18,
      onPressed: () {
        // Favorite Action
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.white,
        size: 30,
      ),
    );
  }
}

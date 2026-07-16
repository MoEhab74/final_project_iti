import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/feature/home/data/models/product_model.dart';
import 'package:final_project/feature/home/presentation/cubit/products/products_cubit.dart';
import 'package:final_project/feature/home/presentation/cubit/products/products_state.dart';
import 'package:final_project/feature/home/presentation/widgets/product_item_widget.dart';
import 'package:final_project/feature/home/presentation/widgets/products_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ShopBuilder extends StatefulWidget {
  final bool isGrid;
  final String heroTagPrefix;

  const ShopBuilder({
    super.key,
    this.isGrid = false,
    this.heroTagPrefix = '',
  });

  @override
  State<ShopBuilder> createState() => _ShopBuilderState();
}

class _ShopBuilderState extends State<ShopBuilder> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return SizedBox(
            height: widget.isGrid ? double.infinity : 200.h,
            child: const Center(child: ProductShimmer()),
          );
        } else if (state is ProductsFailureState) {
          return SizedBox(
            height: 200.h,
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is ProductsSuccessState) {
          products = state.products.cast<ProductModel>();

          Widget content;
          if (widget.isGrid) {
            content = AnimationLimiter(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: 2,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: ProductItem(
                          product: products[index],
                          heroTagPrefix: widget.heroTagPrefix,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            content = AnimationLimiter(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                // padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: products.length,
                separatorBuilder: (_, __) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      horizontalOffset: 40,
                      child: FadeInAnimation(
                        child: SizedBox(
                          width: 145.w,
                          child: ProductItem(
                            product: products[index],
                            heroTagPrefix: widget.heroTagPrefix,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          Widget refreshIndicator = RefreshIndicator(
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
            onRefresh: () async {
              await context.read<ProductsCubit>().getAllProducts();
            },
            child: content,
          );

          if (widget.isGrid) {
            return refreshIndicator;
          } else {
            return SizedBox(
              height: 205.h,
              child: refreshIndicator,
            );
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}

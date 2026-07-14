import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/feature/home/data/models/product_model.dart';
import 'package:final_project/feature/home/presentation/cubit/products_cubit.dart';
import 'package:final_project/feature/home/presentation/cubit/products_state.dart';
import 'package:final_project/feature/home/presentation/widgets/product_item_widget.dart';
import 'package:final_project/feature/home/presentation/widgets/products_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ShopBuilder extends StatefulWidget {
  const ShopBuilder({super.key});

  @override
  State<ShopBuilder> createState() => _ShopBuilderState();
}

class _ShopBuilderState extends State<ShopBuilder> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    context.read<ProductSCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const SizedBox(
            height: 200,
            child: Center(child: ProductShimmer()),
          );
        } else if (state is ProductsFailureState) {
          return SizedBox(
            height: 200.h,
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is ProductsSuccessState) {
          products = state.products.cast<ProductModel>();

          return SizedBox(
            height: 205.h,
            child: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: Colors.white,
              onRefresh: () async {
                await context.read<ProductSCubit>().getAllProducts();
              },
              child: AnimationLimiter(
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
                            child: ProductItem(product: products[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

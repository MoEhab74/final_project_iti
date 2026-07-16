import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/primary_text_form_field.dart';
import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/home/presentation/cubit/products/products_cubit.dart';
import 'package:final_project/feature/home/presentation/cubit/products/products_state.dart';
import 'package:final_project/feature/home/presentation/widgets/product_item_widget.dart';
import 'package:final_project/feature/home/presentation/widgets/products_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProductsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search",
            style: AppStyles.bodyBlackStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  AppTextFormField(
                    hintText: "Search here",
                    prefix: "assets/images/search.png",
                    onFieldSubmitted: (value) {
                      if (value.trim().isEmpty) {
                        context.read<ProductsCubit>().clearSearch();
                        return;
                      }
                      context.read<ProductsCubit>().searchProducts(value);
                    },
                    onChanged: (value) {
                      if (value.trim().isEmpty) {
                        context.read<ProductsCubit>().clearSearch();
                      } else {
                        context.read<ProductsCubit>().searchProducts(value);
                      }
                    },
                  ),
              SizedBox(height: 20.h),
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoadingState) {
                      return const ProductShimmer();
                    }
          
                    if (state is ProductsFailureState) {
                      return Center(child: Text(state.errorMessage));
                    }
          
                    if (state is ProductsSuccessState) {
                      return GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                        itemBuilder: (_, index) {
                          return ProductItem(
                            product: state.products[index],
                          );
                        },
                      );
                    }
          
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  ),
);
  }
}

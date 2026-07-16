import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/primary_button_widget.dart';
import 'package:final_project/core/utils/animated_snack_bar.dart';
import 'package:final_project/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:final_project/feature/cart/presentation/cubit/cart_states.dart';
import 'package:final_project/feature/cart/presentation/widgets/cart_item_widget.dart';
import 'package:final_project/feature/cart/presentation/widgets/cart_summary_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<CartCubit, CartStates>(
            builder: (context, state) {
              if (state is GetCartLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetCartError) {
                return Center(child: Text(state.errorMessage));
              }

              if (state is GetCartSuccess) {
                final cart = state.carts.first;

                return Column(
                  children: [
                    Text("My Cart", style: AppStyles.primaryHeadLinesStyle),

                    SizedBox(height: 20.h),

                    Expanded(
                      child: ListView.separated(
                        itemCount: cart.products.length,
                        separatorBuilder: (_, _) => SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          final product = cart.products[index];

                          return CartItemWidget(
                            title: product.title,
                            price: product.price,
                            thumbnail: product.thumbnail,
                            quantity: product.quantity,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),

                    CartSummaryWidget(
                      subTotal: cart.total,
                      shipping: 80,
                      vat: 0,
                      total: cart.discountedTotal + 80,
                    ),

                    SizedBox(height: 20.h),

                    AppButton(
                      text: "Checkout",
                      onPressed: () {
                        // Show checkout dialog from core/widgets
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Checkout"),
                            content: Text("Are you sure you want to checkout?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Show snackbar with success message
                                  showAnimatedSnackbar(
                                    context,
                                    message: "Checkout successful",
                                    type: AnimatedSnackBarType.success,
                                  );
                                },
                                child: Text("Checkout"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                  ],
                );
              }

              return const Center(child: Text("No items in cart"));
            },
          ),
        ),
      ),
    );
  }
}

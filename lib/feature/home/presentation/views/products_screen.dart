import 'package:final_project/core/routing/app_routes.dart';
import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/feature/home/presentation/widgets/shop_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: AppStyles.bodyBlackStyle,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.onSurfaceColor),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoutes.homeScreen);
            }
          },
        ),
      ),
      body: const ShopBuilder(
        isGrid: true,
        heroTagPrefix: 'products_screen_',
      ),
    );
  }
}
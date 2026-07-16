import 'package:final_project/feature/home/data/models/product_model.dart';
import 'package:final_project/feature/home/presentation/widgets/product_details_body.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsBody(product: product));
  }
}

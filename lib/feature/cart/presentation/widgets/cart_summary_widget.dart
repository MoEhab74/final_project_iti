import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_project/core/themes/app_styles.dart';

class CartSummaryWidget extends StatelessWidget {
  const CartSummaryWidget({
    super.key,
    required this.subTotal,
    required this.shipping,
    required this.vat,
    required this.total,
  });

  final double subTotal;
  final double shipping;
  final double vat;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row("Sub-total", subTotal),
        SizedBox(height: 10.h),

        _row("VAT (%)", vat),
        SizedBox(height: 10.h),

        _row("Shipping fee", shipping),

        SizedBox(height: 16.h),

        Divider(),

        SizedBox(height: 16.h),

        _row("Total", total, isBold: true),
      ],
    );
  }

  Widget _row(String title, double value, {bool isBold = false}) {
    return Row(
      children: [
        Text(
          title,
          style: isBold ? AppStyles.cartTitleStyle : AppStyles.subTitlesStyle,
        ),
        Spacer(),
        Text(
          "\$ ${value.toStringAsFixed(2)}",
          style: isBold ? AppStyles.cartTitleStyle : AppStyles.subTitlesStyle,
        ),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final double w = width ?? 100.0;
    final double h = height ?? 100.0;

    return Center(
      child: SizedBox(
        width: w,
        height: h,
        child: kIsWeb
            ? const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(),
                ),
              )
            : LottieBuilder.asset(
                'assets/json/loading_animation.json',
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HightOrWidthSpace extends StatelessWidget {
  const HightOrWidthSpace({super.key, this.height, this.width});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height?.h ?? 0, width: width?.w ?? 0);
  }
}

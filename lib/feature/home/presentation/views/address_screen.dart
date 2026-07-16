import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/core/themes/app_styles.dart';
import 'package:final_project/core/ui/app_divider.dart';
import 'package:final_project/core/ui/loading_lottie.dart';
import 'package:final_project/feature/home/presentation/cubit/address/address_cubit.dart';
import 'package:final_project/feature/home/presentation/cubit/address/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreenBody extends StatelessWidget {
  const AddressScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppDivider(indent: 8, endIndent: 8),
              SizedBox(height: 24.h),

              Text(
                'Saved Addresses',
                style: AppStyles.bodyBlackStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 16.h),

              Expanded(
                child: BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    if (state is AddressLoadingState) {
                      return const Center(child: LoadingLottie());
                    }

                    if (state is AddressFailureState) {
                      return Center(child: Text(state.errorMessage));
                    }

                    if (state is AddressSuccessState) {
                      return ListView.separated(
                        itemCount: state.addresses.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          final address = state.addresses[index];

                          return AddressWidget(
                            addressTitle: address.name,
                            addressDetails: address.description,
                            onTap: () {},
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
        ),
      ),
    );
  }
}


class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    this.addressTitle,
    this.addressDetails,
    this.onTap,
  });
  final String? addressTitle;
  final String? addressDetails;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 40.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.secondaryColor.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 24.w,
              color: AppColors.grayColor,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addressTitle ?? 'Home',
                    style: AppStyles.bodyBlackStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  SelectableText(
                    addressDetails ??
                        '123 Main St, Springfield, IL 62704, United States',
                    style: AppStyles.bodyGrayStyle.copyWith(
                      fontSize: 14.sp,
                      // fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
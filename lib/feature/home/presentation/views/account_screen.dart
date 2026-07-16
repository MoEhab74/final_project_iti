import 'package:final_project/core/routing/app_routes.dart';
import 'package:final_project/feature/home/presentation/widgets/account_list_tile.dart';
import 'package:final_project/feature/home/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),

            CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.person,
                size: 70.sp,
                color: Colors.grey.shade600,
              ),
            ),

            SizedBox(height: 16.h),

            Text(
              "Mohamed Ehab",
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 35.h),

            Expanded(
              child: ListView(
                children: [
                  AccountListTile(
                    title: "Profile",
                    icon: Icons.person,
                    onTap: () {
                      context.push(AppRoutes.addressScreenBody);
                    },
                  ),

                  SizedBox(height: 16.h),

                  AccountListTile(
                    title: "Setting",
                    icon: Icons.settings,
                    onTap: () {},
                  ),

                  SizedBox(height: 16.h),

                  AccountListTile(
                    title: "Contact",
                    icon: Icons.mail,
                    onTap: () {},
                  ),

                  SizedBox(height: 16.h),

                  AccountListTile(
                    title: "Share App",
                    icon: Icons.share,
                    onTap: () {},
                  ),

                  SizedBox(height: 16.h),

                  AccountListTile(
                    title: "Help",
                    icon: Icons.help,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: GestureDetector(
                onTap: () {
                  showLogoutDialog(context);
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






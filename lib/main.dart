import 'package:final_project/core/routing/route_generator.dart';
import 'package:final_project/core/themes/theme_data.dart';
import 'package:final_project/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Final Project',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          routerConfig: RouteGenerator.mainRoutingInOurApp,
        );
      },
    );
  }
}

import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/auth/cubit/auth_cubit.dart';
import 'package:final_project/feature/auth/login/presentation/views/login_screen.dart';
import 'package:final_project/feature/auth/sign_up/presentation/views/sign_up_screen.dart';
import 'package:final_project/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:final_project/feature/cart/presentation/views/cart_screen.dart';
import 'package:final_project/feature/home/presentation/cubit/address/address_cubit.dart';
import 'package:final_project/feature/home/presentation/cubit/products/products_cubit.dart';
import 'package:final_project/feature/home/presentation/views/address_screen.dart';
import 'package:final_project/feature/home/presentation/views/home_screen.dart';
import 'package:final_project/feature/home/presentation/views/products_screen.dart';
import 'package:final_project/feature/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => locator<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(create: (_) => locator<AuthCubit>()),
            BlocProvider<ProductsCubit>(
              create: (_) => locator<ProductsCubit>(),
            ),
            BlocProvider<CartCubit>(
              create: (_) => locator<CartCubit>()..getUserCart(),
            ),
          ],
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplachScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.addressScreenBody,
      //   name: AppRoutes.addressScreenBody,
      //   builder: (context, state) => BlocProvider(
      //     create: (_) => locator<AddressCubit>()..getAllAddresses(),
      //     child: const AddressScreenBody(),
      //   ),
      // ),
      GoRoute(
        path: AppRoutes.productsScreen,
        name: AppRoutes.productsScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => locator<ProductsCubit>(),
          child: const ProductsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.addressScreenBody,
        name: AppRoutes.addressScreenBody,
        builder: (context, state) => BlocProvider(
          create: (_) => locator<AddressCubit>()..getAllAddresses(),
          child: const AddressScreenBody(),
        ),
      ),
      GoRoute(
        path: AppRoutes.cartScreen,
        name: AppRoutes.cartScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => locator<CartCubit>()..getUserCart(),
          child: const CartScreen(),
        ),
      ),
    ],
  );
}

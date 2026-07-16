import 'package:final_project/core/themes/app_colors.dart';
import 'package:final_project/feature/cart/presentation/views/cart_screen.dart';
import 'package:final_project/feature/home/presentation/views/account_screen.dart';
import 'package:final_project/feature/home/presentation/widgets/home_screen_body.dart';
import 'package:final_project/feature/home/presentation/views/search_view_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late final List<Widget> pages = [
    const HomeScreenBody(),
    const SearchViewBody(),
    const CartScreen(), //1
    const AccountScreenBody(), //2
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grayColor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.primaryColor),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: AppColors.primaryColor),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: AppColors.primaryColor),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColors.primaryColor),
            label: 'Account',
          ),
        ],
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }
}

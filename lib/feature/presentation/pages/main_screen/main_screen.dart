import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onChangedPage(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onChangedPage,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          FavoritePage(),
          ProfilePage(),
          BasketPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (value) => pageController.jumpToPage(value),
        backgroundColor: greenColor,
        currentIndex: _currentIndex,
        activeColor: yellowColor,
        iconSize: 24,
        inactiveColor: Colors.white,
        height: 54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Главный",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Избранное",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: "Профиль",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Корзина",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Настройка",
          ),
        ],
      ),
    );
  }
}

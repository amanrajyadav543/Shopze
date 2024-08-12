
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/screens/favourite/favourite_screen.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/home_screen.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/my_orders.dart';
import 'package:shopzy_grocery_user/view/screens/setting/setting_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  BottomNavigationBarScreenState createState() =>
      BottomNavigationBarScreenState();
}

class BottomNavigationBarScreenState
    extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyOrdersScreen(),
    FavouriteScreen(),
    SettingScreen(),
    // MenuBottomSheet(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to open the MenuBottomSheet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag),
            label: 'my_orders'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: 'favourite'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        unselectedItemColor: Theme.of(context).hintColor,
        unselectedLabelStyle: interRegular.copyWith(
          color: Theme.of(context).hintColor,fontSize: 10
        ),
        showUnselectedLabels: true,
      ),
    );
  }
}

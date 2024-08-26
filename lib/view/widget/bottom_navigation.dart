import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        // fixedColor: Color.fromRGBO(255, 255, 255, 1),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        selectedItemColor:const Color.fromRGBO(234, 133, 82, 1) ,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
            backgroundColor: Color.fromRGBO(13, 13, 14, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: Color.fromRGBO(13, 13, 14, 1),
            ),
            label: "Search",
            backgroundColor: Color.fromRGBO(13, 13, 14, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Color.fromRGBO(13, 13, 14, 1),
            ),
            label: "Cart",
            backgroundColor: Color.fromRGBO(13, 13, 14, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              color: Color.fromRGBO(13, 13, 14, 1),
            ),
            label: "Settings",
            //backgroundColor: Color.fromRGBO(13,13,14,1),
          ),
        ]);
  }
}

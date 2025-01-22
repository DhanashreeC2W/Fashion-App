import 'package:fashion_app/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    /// ACCESSING THE BOTTOM NAVIGATION CONTROLLER FROM THE PROVIDER
    BottomNavigationController bottomNavigationController =
        Provider.of<BottomNavigationController>(context);

    return Scaffold(
        backgroundColor: Colors.white,

        /// BODY OF THE SCAFFOLD THAT DISPLAYS THE CURRENTLY SELECTED SCREEN
        body: bottomNavigationController.allScreensList
            .elementAt(bottomNavigationController.selectedScreenIndex),

        /// BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            /// HOME NAVIGATION ITEM
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/home.png")),
                label: "Home"),

            /// SEARCH NAVIGATION ITEM
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/search.png")),
                label: "Search"),

            /// CART NAVIGATION ITEM
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/cart.png")),
                label: "Cart"),

            /// SETTINGS NAVIGATION ITEM
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/settings.png")),
                label: "Settings")
          ],

          /// STYLE AND COLOR PROPERTIES FOR THE BOTTOM NAVIGATION BAR
          unselectedItemColor: const Color.fromRGBO(13, 13, 14, 1),
          selectedItemColor: const Color.fromRGBO(255, 122, 0, 1),
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,

          /// CURRENTLY SELECTED INDEX OF THE NAVIGATION BAR
          currentIndex: bottomNavigationController.selectedScreenIndex,

          /// HANDLING NAVIGATION ITEM TAPS
          onTap: bottomNavigationController.onTapScreen,

          /// BACKGROUND COLOR AND TYPE OF THE NAVIGATION BAR
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

          type: BottomNavigationBarType.fixed,
        ));
  }
}

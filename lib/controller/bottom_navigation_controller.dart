import 'package:flutter/material.dart';

import '../view/cart_screen.dart';
import '../view/home_screen.dart';
import '../view/search_screen.dart';
import '../view/settings_screen.dart';

/// BOTTOM NAVIGATION CONTROLLER CLASS
/// THIS CLASS MANAGES THE STATE AND BEHAVIOR OF THE BOTTOM NAVIGATION BAR.
class BottomNavigationController extends ChangeNotifier {
  /// INDEX OF THE CURRENTLY SELECTED SCREEN
  int selectedScreenIndex = 0;

  /// LIST OF ALL SCREENS AVAILABLE IN THE NAVIGATION BAR
  List<Widget> allScreensList = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];

  /// FUNCTION TO HANDLE NAVIGATION ITEM TAPS
  /// UPDATES THE SELECTED SCREEN INDEX AND NOTIFIES LISTENERS.
  void onTapScreen(int index) {
    selectedScreenIndex = index;

    /// NOTIFY ALL LISTENERS ABOUT THE STATE CHANGE
    notifyListeners();
  }
}
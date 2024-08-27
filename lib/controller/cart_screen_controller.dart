import 'package:flutter/material.dart';

/// PROVIDER CLASS FOR MANAGING CART SCREEN STATE
class CartScreenProvider extends ChangeNotifier {
  bool isLike = true;

  /// TOGGLE LIKE STATUS FOR A SPECIFIC ITEM BY INDEX
  void toggleLike() {
    isLike = !isLike;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

/// PROVIDER FOR DETAILS SCREEN THAT MANAGES BOOKMARK AND SIZE SELECTION.
class DetailsScreenProvider extends ChangeNotifier {
  /// BOOLEAN TO TRACK IF THE ITEM IS BOOKMARKED.
  bool isBookMarked = false;

  /// INTEGER TO TRACK THE SELECTED SIZE.
  int selectedSize = 2;

  /// TOGGLES THE BOOKMARK STATE.
  void toggleBookmark() {
    isBookMarked = !isBookMarked;
    notifyListeners();
  }

  /// SETS THE SELECTED SIZE AND NOTIFIES LISTENERS.
  void selectSize(int index) {
    selectedSize = index;
    notifyListeners();
  }

  /// RETURNS THE COLOR FOR THE SIZE OPTION BASED ON SELECTION STATE.
  Color? showColor(int index) {
    if (selectedSize == index) {
      return const Color.fromRGBO(13, 13, 14, 1);
    } else {
      return const Color.fromRGBO(255, 255, 255, 1);
    }
  }

  ///LIST OF SIZESON DETAILS SCREEN
  List<String> sizeList = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];
}

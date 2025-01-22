import 'package:fashion_app/model/item_model.dart';
import 'package:flutter/material.dart';

class ItemsData extends ChangeNotifier {
  ///LIST OF ALL ITEMS ON HOME SCREEN

  List<ItemsModel> itemsList = [
    ItemsModel(
      img: "assets/images/img2.png",
      price: 240.32,
      name: "Tagerine Shirt",
    ),
    ItemsModel(
      img: "assets/images/img1.png",
      price: 325.36,
      name: "Leather Coart",
    ),
    ItemsModel(
      img: "assets/images/img4.png",
      price: 126.47,
      name: "Tagerine Shirt",
    ),
    ItemsModel(
      img: "assets/images/img3.png",
      price: 257.85,
      name: "Leather Coart",
    ),
    ItemsModel(
      img: "assets/images/img1.png",
      price: 240.32,
      name: "Tagerine Shirt",
    ),
    ItemsModel(
      img: "assets/images/img2.png",
      price: 325.36,
      name: "Leather Coart",
    ),
    ItemsModel(
      img: "assets/images/img3.png",
      price: 126.47,
      name: "Tagerine Shirt",
    ),
    ItemsModel(
      img: "assets/images/img4.png",
      price: 257.85,
      name: "Leather Coart",
    )
  ];

  ///CURRENTLY SLECTED
  ItemsModel? _selectedItem;

  ///GETTER METHOD FOR SELECTED ITEM
  ItemsModel? get selectedItem => _selectedItem;

  void selectItem(ItemsModel item) {
    _selectedItem = item;
    notifyListeners();
  }

  ///
  int selectedCategory = 0;

  void selectedCategories(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  /// RETURNS THE COLOR FOR THE CATEGORY OPTION BASED ON SELECTION STATE.
  Color? showCategoryColor(int index) {
    if (selectedCategory == index) {
      return const Color.fromRGBO(255, 122, 0, 1);
    } else {
      return const Color.fromRGBO(255, 255, 255, 1);
    }
  }

  ///CATEGORY LIST ON HOME SCREEN
  List categoryList = [
    "All",
    "Men",
    "Women",
    "Kids",
    "Others",
  ];

  ///IMAGES LIST ON CHECKOUTSCREEN
  List imagesList = [
    "assets/images/pay1.png",
    "assets/images/pay2.png",
    "assets/images/pay3.png",
    "assets/images/pay4.png",
    "assets/images/pay5.png",
  ];
}

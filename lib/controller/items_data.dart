import 'package:fashion_app/model/item_model.dart';
import 'package:flutter/material.dart';

class ItemsData extends ChangeNotifier {
  ///LIST OF ALL ITEMS ON HOME SCREEN

  List<ItemsModel> itemsList = [
    ItemsModel(
        img: "assets/images/img2.png", price: 240.32, name: "Tagerine Shirt"),
    ItemsModel(
        img: "assets/images/img1.png", price: 325.36, name: "Leather Coart"),
    ItemsModel(
        img: "assets/images/img4.png", price: 126.47, name: "Tagerine Shirt"),
    ItemsModel(
        img: "assets/images/img3.png", price: 257.85, name: "Leather Coart"),
    ItemsModel(
        img: "assets/images/img1.png", price: 240.32, name: "Tagerine Shirt"),
    ItemsModel(
        img: "assets/images/img2.png", price: 325.36, name: "Leather Coart"),
    ItemsModel(
        img: "assets/images/img3.png", price: 126.47, name: "Tagerine Shirt"),
    ItemsModel(
        img: "assets/images/img4.png", price: 257.85, name: "Leather Coart")
  ];

  ///CURRENTLY SLECTED PLANT
  ItemsModel? _selectedItem;

  ///GETTER METHOD FOR SELECTED ITEM
  ItemsModel? get selectedItem => _selectedItem;

  void selectItem(ItemsModel item) {
    _selectedItem = item;
    notifyListeners();
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

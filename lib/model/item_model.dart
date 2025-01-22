/// MODEL CLASS FOR ITEMS, CONTAINING IMAGE, PRICE, AND NAME
class ItemsModel {
  /// IMAGE URL OR ASSET PATH FOR THE ITEM
  final String? img;

  /// PRICE OF THE ITEM
  final double? price;

  /// NAME OF THE ITEM
  final String? name;

  ItemsModel({
    required this.img,
    required this.price,
    required this.name,
  });
}

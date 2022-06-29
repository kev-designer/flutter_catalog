import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._iternal();

  CartModel._iternal();
  factory CartModel() => cartModel;
  
  //CATALOG FIELD
  late CatalogModel _catalog;

  //COLLECTION OF IDS
  final List<int> _itemIds = [];

  //GET CATALOG
  CatalogModel get catalog => _catalog;

  //SET CATALOG
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //GET ITEMS IN CART
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //GET TOTAL PRICE
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //ADD ITEM
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //REMOVE ITEM
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

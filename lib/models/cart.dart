import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}

//ADD ITEM
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

//REMOVE ITEM
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}

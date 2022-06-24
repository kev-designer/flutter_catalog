import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "Keval Gadhiya";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: CatalogModel.items[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decoData = jsonDecode(catalogJson);
    var productsData = decoData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: (CatalogModel.items.isNotEmpty)
          ? GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: CatalogModel.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final item = CatalogModel.items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GridTile(
                    //ITEM NAME
                    header: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //AMOUNT
                    footer: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Text(
                        "\$${item.price}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    child: Image.network(item.image),
                  ),
                );
              },
            )
          // ListView.builder(
          //     padding: const EdgeInsets.all(20),
          //     itemCount: CatalogModel.items.length,
          //     itemBuilder: (context, index) {
          //       return ItemWidget(
          //         item: CatalogModel.items[index],
          //       );
          //     },
          //   )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
    );
  }
}

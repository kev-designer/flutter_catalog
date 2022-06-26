import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/models/catalog.dart';

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CalatogHear(),
              if (CatalogModel.items.isNotEmpty)
                const CalatogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

//CATALOG HEADER
class CalatogHear extends StatelessWidget {
  const CalatogHear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.dartBluishColor).make(),
        10.heightBox,
        "Treanding Products".text.xl2.make(),
        10.heightBox,
      ],
    );
  }
}

//CATALOG LIST
class CalatogList extends StatefulWidget {
  const CalatogList({Key? key}) : super(key: key);

  @override
  State<CalatogList> createState() => _CalatogListState();
}

class _CalatogListState extends State<CalatogList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog);
      },
    );
  }
}

//CATALOG ITEM
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem(this.catalog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(MyTheme.dartBluishColor).bold.make(),
                8.heightBox,
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    " \$${catalog.price}".text.xl.make(),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.dartBluishColor,
                        ),
                      ),
                      onPressed: () {},
                      child: "Buy".text.make(),
                    )
                  ],
                ).pOnly(right: 12),
              ],
            ),
          )
        ],
      ),
    ).white.rounded.square(140).make().py16();
  }
}

//CATALOG IMAGE
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        image,
      ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context),
    );
  }
}

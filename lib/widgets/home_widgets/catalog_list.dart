import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'catalog_image.dart';

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
        //  final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Hero(
                tag: Key(
                  catalog.id.toString(),
                ),
                child: HomeDetailsPage(catalog: catalog),
              ),
            ),
          ),
          child: CatalogItem(catalog),
        );
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
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                8.heightBox,
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    " \$${catalog.price}".text.xl.make(),
                    _AddToCart(catalog: catalog)
                  ],
                ).pOnly(right: 12),
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(140).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.theme.buttonColor,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel(); 
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      child: isAdded ? const Icon(Icons.done) : "Buy".text.make(),
    );
  }
}

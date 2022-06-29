import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          context.theme.buttonColor,
                        ),
                        shape: MaterialStateProperty.all(
                          const StadiumBorder(),
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
    ).color(context.cardColor).rounded.square(140).make().py16();
  }
}

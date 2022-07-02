import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(catalog.image).centered().h32(context).p32(),
          Expanded(
            child: VxArc(
              arcType: VxArcType.CONVEY,
              height: 32.0,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //NAME
                    catalog.name.text.xl4
                        .color(context.theme.accentColor)
                        .bold
                        .make(),
                    8.heightBox,

                    //DES
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "Clita rebum et kasd accusam lorem sed ut consetetur, et lorem accusam justo et. Voluptua et lorem takimata justo. No ut et kasd amet labore ipsum dolore et. Voluptua dolor voluptua aliquyam et ipsum duo et. Aliquyam lorem clita kasd labore et elitr accusam. Magna justo ipsum sea aliquyam diam."
                        .text
                        .textStyle(context.captionStyle)
                        .center
                        .xl
                        .make()
                        .p20()
                        .expand(),
                  ],
                ).py32(),
              ),
            ),
          ),
        ],
      ),

      //BUTTONS
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            " \$${catalog.price}".text.xl4.bold.make(),
            AddToCart(
              catalog: catalog,
            ).wh(100, 50)
          ],
        ).p24(),
      ),
    );
  }
}
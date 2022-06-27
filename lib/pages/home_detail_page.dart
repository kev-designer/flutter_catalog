import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
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
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(catalog.image).centered().h60(context).p32(),
            ),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                height: 32.0,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      catalog.name.text.xl4
                          .color(MyTheme.dartBluishColor)
                          .bold
                          .make(),
                      8.heightBox,
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),

      //BUTTONS
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            " \$${catalog.price}".text.xl4.bold.make(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyTheme.dartBluishColor,
                ),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                ),
              ),
              onPressed: () {},
              child: "Buy".text.xl.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//CATALOG HEADER
class CalatogHeader extends StatelessWidget {
  const CalatogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        10.heightBox,
        "Treanding Products".text.xl2.make(),
        10.heightBox,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Cart".text.xl2.semiBold.make(),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [
          _CartList().p32().expand(),

          //DIVIDER
          Divider(
            color: context.theme.accentColor,
            thickness: 0.9,
          ),

          //TOTAL VALUE CART
          const _CartTotal(),
        ],
      ),
    );
  }
}

//CARD TOTAL
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .bold
              .xl4
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.buttonColor,
              ),
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet...".text.xl.make(),
                ),
              );
            },
            child: "Buy".text.xl2.semiBold.make(),
          ).w32(context).h8(context),
        ],
      ),
    );
  }
}

//CART LIST
class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(
      context,
      on: [RemoveMutation],
    );
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () {
                    //  RemoveMutation(item)
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name.text.make(),
              );
            },
          );
  }
}

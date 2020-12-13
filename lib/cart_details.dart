import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping_cart.dart';

class CartDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = ShoppingCart.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details"),
      ),
      body: Center(
        child: Text(
          "${cart.products.length} Selected",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

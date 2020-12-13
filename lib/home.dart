import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/product.dart';
import 'package:shopping_cart/shopping_cart.dart';

import 'cart_details.dart';

class Home extends StatelessWidget {
  List<Product> items = List.generate(50, (_) {
    return Product(
      name: 'Product $_',
      price: Random().nextInt(5000),
      isCheck: false,
    );
  });
  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = ShoppingCart.of(context);

    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Shopping Cart"),
            actions: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 20),
                child: Badge(
                  badgeContent: Text(
                    '${cart.products.length}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartDetails(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(child: Text(items[i].name)),
                      Checkbox(
                        value: items[i].isCheck,
                        onChanged: (value) {
                          setState(() {
                            items[i].isCheck = !items[i].isCheck;
                            if (items[i].isCheck) {
                              cart.products.add(items[i]);
                            } else {
                              cart.products.remove(items[i]);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  subtitle: Text(
                    '${items[i].price} EGP',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

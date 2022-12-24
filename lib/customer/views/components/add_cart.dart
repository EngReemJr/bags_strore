import 'dart:developer';

import 'package:firebase_start/admin/providers/admin_provider.dart';
import 'package:firebase_start/customer/views/components/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../admin/models/product.dart';
import 'constant.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    @required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Color.fromARGB(255, 121, 91, 35)),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                product!.count = CartCounterState.numOfItems;
                
                Provider.of<AdminProvider>(context, listen: false)
                    .insertNewProduct(product!);
              },
            ),
          ),
          Expanded(
            child: Container(
              color: backColor,
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Place Order".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

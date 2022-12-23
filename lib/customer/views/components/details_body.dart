import 'package:firebase_start/admin/providers/admin_provider.dart';
import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:firebase_start/customer/views/components/description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../admin/models/product.dart';
import '../../../auth/providers/auth_provider.dart';
import 'Color_and_size.dart';
import 'add_cart.dart';
import 'counter.dart';
import 'product_title.dart';


class Body extends StatelessWidget {
  final Product? product;

  const Body({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color:Provider.of<AuthProvider>(context).isDarkMode?
                    Colors.black:  
                                      Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

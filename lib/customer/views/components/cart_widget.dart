import 'dart:developer';

import 'package:firebase_start/admin/providers/admin_provider.dart';
import 'package:firebase_start/app_router/app_router.dart';
import 'package:firebase_start/customer/views/components/details_body.dart';
import 'package:firebase_start/customer/views/components/product_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../admin/models/cart_product.dart';
import '../../../admin/models/product.dart';
import '../screens/details_screen.dart';

class Cart_Product_Widget extends StatelessWidget {
  CartProduct product;
  Cart_Product_Widget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  // right: -40,
                  // top: 10,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          Provider.of<AdminProvider>(context, listen: false)
                              .deleteCartProduct(product);
                        },
                        icon: Icon(Icons.delete)),
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Product Name' + ': ' + product.name,
                            ),
                            Text(
                              'Product Price' + ': ' + product.price + '\$',
                            ),
                            Text(
                              'Product Count' +
                                  ': ' +
                                  product.count.toString() 
                                  ,
                            ),
                            Text(
                              'Product Size' +
                                  ': ' +
                                  product.size.toString() +
                                  'cm',
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(13)),
                      child: SizedBox(
                          width: double.infinity,
                          height: 170,
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

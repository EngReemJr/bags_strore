import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../admin/models/product.dart';

class Cart_Product_Widget extends StatelessWidget {
  Product product;
  Cart_Product_Widget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
        
        Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
         // color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        children: [
          Stack(
            children: [
              /* ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                    child: SizedBox(
                        width: double.infinity,
                        height: 170,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        )),
                  ),*/
              Positioned(
                // right: -40,
                // top: 10,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
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
                            'Product Price' + ': ' + product.price,
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
     
    );
  }
}

import 'dart:developer';

import 'package:firebase_start/admin/providers/admin_provider.dart';
import 'package:firebase_start/admin/views/screens/add_product.dart';
import 'package:firebase_start/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../auth/providers/auth_provider.dart';
import '../../models/product.dart';

class ProductWidget extends StatelessWidget {
  Product? product;
  String? catId;
  ProductWidget(this.product, this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (product != null) {
      return InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(13)),
                    child: SizedBox(
                        width: double.infinity,
                        height: 170.h,
                        child: Image.network(
                          product!.imageUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                      right: 15,
                      top: 10,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                          ),
                        ],
                      ))
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Product Name' + ': ' + product!.name,
                        ),
                        Text(
                          'Product Price' + ': ' + product!.price,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (product == null
    // &&
       // Provider.of<AuthProvider>(context, listen: false).loggedUser!.isAdmin
        ) {
      return Card(
        color: Color.fromARGB(255, 203, 195, 195),
        child: Center(
          child: FloatingActionButton(
            onPressed: () {
              AppRouter.appRouter.goToWidget(AddNewProduct(catId!));
            },
            child: Icon(Icons.add),
            backgroundColor: Color(0xffd56561),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}

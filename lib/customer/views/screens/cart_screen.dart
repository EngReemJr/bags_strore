import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_start/admin/providers/admin_provider.dart';
import 'package:firebase_start/admin/views/components/ButtonWidget.dart';
import 'package:firebase_start/customer/views/components/costome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../components/cart_widget.dart';
import '../components/constant.dart';
import '../components/product_body.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int totalPrice;

  @override
  Widget build(BuildContext context) {
    totalPrice = 0;
    return Scaffold(
        appBar: CustomeAppBar(),
        body: Consumer<AdminProvider>(builder: (context, provider, c) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
             , Expanded(
                child: Provider.of<AdminProvider>(context).allCartProducts == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: provider.allCartProducts!.length,
                        itemBuilder: (context, Index) {
                          totalPrice = totalPrice +
                              int.parse(provider.allCartProducts![Index]!.price);
                          // setStat
                          return Cart_Product_Widget(
                              provider.allCartProducts![Index]);
                        },
                      ),
              ),
                 Row(children: [
                  // Expanded(
                  //  child:
                  Text(
                    'Total Price :' + provider.totalPrice.toString()+ ' \$',
                    style: TextStyle(fontSize: 16),
                  ),
                  //),
                  Expanded(child: MyButtonWidget('Place Order', () {})),
                ]),
            
               SizedBox(
                height: 20.h,
              )
            ],
             
              // provider.changeTotalPrice(totalPrice);

                  

          );
         //()({
            //})
        }
        
        )
        
       // provider.changeTotalPrice(totalPrice);
        );
  }
}

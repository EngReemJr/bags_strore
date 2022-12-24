import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:firebase_start/customer/views/components/costome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../admin/models/product.dart';
import '../components/details_body.dart';


class DetailsScreen extends StatelessWidget {
  final dynamic? product;

  const DetailsScreen({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
    //  backgroundColor: product.color,
    backgroundColor: Color.fromARGB(255, 146, 178, 205),
      appBar:CustomeAppBar(),
      body: Body(product: product),
    );
  }

 
  
}

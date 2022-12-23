import 'package:firebase_start/customer/views/components/costome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/constant.dart';
import '../components/product_body.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(),

      //buildAppBar(),
      body: Body(),
    );
  }
}

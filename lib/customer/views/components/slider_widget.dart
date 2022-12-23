import 'package:firebase_start/admin/models/category.dart';
import 'package:firebase_start/customer/views/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../admin/models/product.dart';
import '../../../admin/providers/admin_provider.dart';
import '../../../admin/views/screens/display_products.dart';
import '../../../app_router/app_router.dart';

class MySliderWidget extends StatelessWidget {
  Category catName;
  MySliderWidget(this.catName);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          Provider.of<AdminProvider>(context, listen: false)
            .getAllProducts(catName.id!);
            
        AppRouter.appRouter.goToWidget(ProductScreen());
      },
     child:
 Column(children: [
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(catName.imageUrl), fit: BoxFit.contain),
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 249, 250, 244),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 228, 234, 224),
                blurRadius: 15.0, // soften the shadow
              )
            ],
          ),
        ),
      ),
      Text(catName.nameEn),
    ])
    )
    ;
  }
}

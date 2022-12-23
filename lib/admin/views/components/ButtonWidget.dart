import 'package:firebase_start/admin/models/category.dart';
import 'package:firebase_start/admin/providers/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../admin/models/product.dart';

class MyButtonWidget extends StatelessWidget {
  String title;
  Function myFun;
  var parameter;
  MyButtonWidget(this.title, this.myFun, [this.parameter]);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: SizedBox(),
      ),
      Container(
        width: 250.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(41),
          color: Color.fromARGB(255, 249, 250, 244),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 228, 234, 224),
              blurRadius: 15.0, // soften the shadow
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(41),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xffd56561)
                  // Color.fromARGB(
                  //  255, 253, 194, 42), // Background col
                  ),
              onPressed: () {
                //  Provider.of<AdminProvider>(context, listen: false)
                //    .AddNewSlider();
                if (parameter == null) {
                  myFun();
                } else {
                  myFun(parameter);
                }
              },
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 254, 253, 253),
                ),
              )),
        ),
      )
    ]);
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../admin/models/product.dart';

class MySliderWidget extends StatelessWidget {
  String catName ;
  MySliderWidget(this.catName);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.75,
      height: 30.h,
      margin: EdgeInsets.all(10),
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
            style: ElevatedButton.styleFrom(primary: Color(0xffca8094)
                // Color.fromARGB(
                //  255, 253, 194, 42), // Background color
                ),
            onPressed: () {},
            child: Text(
              catName,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xfffafbf7),
              ),
            ),
          )),
    );
  }
}

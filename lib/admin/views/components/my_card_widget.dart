import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  late String nextPage, imageUrl, title;
  late Widget icon;
  MyCardWidget(
      {required this.icon,
      required this.nextPage,
      required this.imageUrl,
      required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(nextPage);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            /*Image.network(
              imageUrl,
              height: 120,
            ),*/
            Text(title),
          ],
        ),
      ),
    );
  }
  //),
  // );
}
//}

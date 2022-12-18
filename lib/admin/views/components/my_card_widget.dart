import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  late String nextPage, imageUrl, title;
  MyCardWidget({required this.nextPage, required this.imageUrl, required this.title});
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
            Image.network(
              imageUrl,
              height: 120,
            ),
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

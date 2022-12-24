import 'package:flutter/material.dart';

import 'constant.dart';

class CartCounter extends StatefulWidget {
  @override
  CartCounterState createState() => CartCounterState();
}

class CartCounterState extends State<CartCounter> {
   static int   numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: decreaserCounter,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: 
              incrementCounter
            ),
      ],
    );
  }

  Container buildOutlineButton({IconData? icon, Function? press}) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      width: 40,
      height: 32,
      child: OutlinedButton(
        onPressed: () {
          press!();
        },
        child: Icon(icon),
      ),
    );
  }

  incrementCounter() {
    
      setState(() {
       ++ numOfItems;
      });
    }
  

  decreaserCounter() {
    if (numOfItems > 1) {
    setState(() {
     -- numOfItems;
      });}
  }
}

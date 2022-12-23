import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:flutter/material.dart';

import '../../../admin/models/product.dart';
import '../screens/details_screen.dart';

class ItemCard extends StatelessWidget {
  final Product? product;
  final Function? press;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => 
        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        product: product
                                      ),
                                    ))
      ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                //  color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product!.id}",
                child: Image.network(product!.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product!.name,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product!.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

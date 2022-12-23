import 'package:firebase_start/admin/providers/admin_provider.dart';
import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/details_screen.dart';
import 'ItemCard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(builder: (context, provider, w) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          ),
          // Categories(),

          Provider.of<AdminProvider>(context).allProducts == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: GridView.builder(
                        itemCount: provider.allProducts!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) => ItemCard(
                              product: provider.allProducts![index],
                        
                            )),
                  ),
                ),
        ],
      );
    });
  }
}

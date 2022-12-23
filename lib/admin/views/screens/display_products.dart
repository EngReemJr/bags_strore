import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_start/customer/views/components/costome_appbar.dart';

import '../../../app_router/app_router.dart';
import '../../providers/admin_provider.dart';
import '../components/product_widget.dart';

class AllProductsScreen extends StatelessWidget {
  final String catId;
  const AllProductsScreen(
  
   this.catId,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomeAppBar(),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                  // childAspectRatio: 3 / 2,
                    //crossAxisSpacing: 20,
                  //  mainAxisSpacing: 20
                    
                    
                    ),
                    
                itemCount: provider.allProducts!.length + 1,
                itemBuilder: (context, index) {
                  if (index != provider.allProducts!.length) {
                    return ProductWidget(provider.allProducts![index], catId);
                  } else if (provider.allProducts!.isEmpty) {
                    return ProductWidget(null,catId);
                  } else {
                    return ProductWidget(null,catId);
                  }
                });
      }),
    );
  }
}

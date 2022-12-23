import 'package:firebase_start/admin/views/screens/main_admin_screen.dart';
import 'package:firebase_start/app_router/app_router.dart';
import 'package:firebase_start/auth/providers/auth_provider.dart';
import 'package:firebase_start/auth/screen/profile_screen.dart';
import 'package:firebase_start/customer/views/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../admin/providers/admin_provider.dart';
import 'constant.dart';

class CustomeAppBar extends StatelessWidget with PreferredSizeWidget {
  bool? noParent;
  CustomeAppBar([this.noParent]) {
    this.noParent = noParent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color:
                /*  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 127, 115, 128),*/
                backColor
            //  Color(0xff180816),
            /* ])*/),
        child: Provider.of<AuthProvider>(context).loggedUser == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    noParent == null
                        ? IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ))
                        : const SizedBox(),
                    InkWell(
                      onTap: () {
                      //  Navigator.of(context).pushNamed('myProfilePage');
                      Navigator.of(context).push(new MaterialPageRoute(builder: 
                   (BuildContext context) => new myProfilePage()));
                      
                      },
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {
                          Provider.of<AdminProvider>(context, listen: false)
                              .getAllProducts('lGGKgPJkXfHZDDCSgb69');
                          AppRouter.appRouter.goToWidget(CartScreen());
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )),
                    Provider.of<AuthProvider>(context).loggedUser!.isAdmin
                        ? IconButton(
                            onPressed: () {
                              AppRouter.appRouter.goToWidget(AdminDashBoard());
                            },
                            icon: const Icon(Icons.settings),
                            color: Colors.white,
                          )
                        : const SizedBox()
                  ],
                ),
                Expanded(
                  child: Text(
                    'Hello ' +
                        Provider.of<AuthProvider>(context)
                            .loggedUser!
                            .userName +
                        '\n',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Ready to discover beautiful accessories?',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[350],
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
        // Color(0xffa973ab),
      ),
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(625.w, 200.h);
}

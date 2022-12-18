import 'package:firebase_start/admin/views/screens/main_admin_screen.dart';
import 'package:firebase_start/app_router/app_router.dart';
import 'package:firebase_start/auth/providers/auth_provider.dart';
import 'package:firebase_start/auth/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: 
          /*  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 127, 115, 128),*/
             Color(0xffd56561)
              //  Color(0xff180816),
           /* ])*/),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  AppRouter.appRouter.goToWidget(myProfilePage());
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
                    Provider.of<AuthProvider>(context).loggedUser!.isAdmin
              ? IconButton(
                  onPressed: () {
                    AppRouter.appRouter.goToWidget(AdminDashBoard());
                  },
                  icon: Icon(Icons.settings),color: Colors.white,)
              : SizedBox()
            ],
          ),
          Text(
            'Hello ' + Provider.of<AuthProvider>(context).loggedUser!.userName+'\n',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Ready to discover beautiful accessories?',
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey[350],
                fontWeight: FontWeight.w600),
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

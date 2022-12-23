import 'package:firebase_start/app_router/app_router.dart';
import 'package:firebase_start/auth/screen/sign_in_screen.dart';
import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/spalsh_screen.jpg'),
            fit: BoxFit.cover),
      ),
      child:
       Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('All luxury accessories in one place\n',
            style: TextStyle(fontSize: 20 ,color: Color(0xff763a2f),fontWeight: FontWeight.bold),
            ),
       
            Row(
              children: [
                Expanded(child: SizedBox(),),
                FloatingActionButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(signInScreen());
                   
              },
              child: Icon(Icons.arrow_forward),
              backgroundColor: backColor,
                      ),
                      Text('  ')
            ])],
             ),
       ),
    ));
  }
}

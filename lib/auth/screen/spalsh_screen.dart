

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class SplachScreen extends StatelessWidget {
  navigationFun(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Provider.of<AuthProvider>(context, listen: false).checkUser();
  }

  @override
  Widget build(BuildContext context) {
    navigationFun(context);
    // TODO: implement build
    return 
     Scaffold(
        
       body:   Container(
decoration: const BoxDecoration(
  image: DecorationImage(
      image: AssetImage('assets/images/spalsh_screen.jpg'),
      fit: BoxFit.cover
      ),
    )));
  }
}
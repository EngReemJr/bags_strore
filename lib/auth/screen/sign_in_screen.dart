

import 'package:firebase_start/auth/providers/auth_provider.dart';
import 'package:firebase_start/auth/screen/sign_up_screen.dart';
import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_router/app_router.dart';
import '../component/custome_textFeild.dart';

class signInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login_screen.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Welcome\nBack",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
            
              
              child: Consumer<AuthProvider>(builder: (context, provider, x) {
                return Form(
                  key: provider.signInKey,

             child: Column(children: [
                CustomTextfield(
                  validation: provider.emailValidation,
                  label: 'Email',
                  
             controller: provider.loginEmailController,
             isPassword: false
                  ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(
                  validation: provider.passwordValidation,
                  label: 'Password',
                   
          controller: provider.passwordLoginController,
          isPassword : true),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xff4c505b),
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: backColor,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          provider.signIn();

                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          AppRouter.appRouter
                          .goToWidgetAndReplacement(signUpScreen());
                        },
                        child: const Text(
                          'You dont have an account? Register now!',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                     
                    ]),
              ]));}),





            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:firebase_start/auth/providers/auth_provider.dart';
import 'package:firebase_start/auth/screen/sign_in_screen.dart';
import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../app_router/app_router.dart';
import '../component/custome_textFeild.dart';

class signUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register_backgorund.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(children: [
            Container(
              padding: const EdgeInsets.only(left: 35, 
              
             // top: 80
              ),
              child: const Text(
                "Create Account\n\n",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Center(
              
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)
                
                ,
                color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.85,
                
               padding: EdgeInsets.only(
                   // right: 35,
                   // left: 35,
                    top: MediaQuery.of(context).size.height * 0.015),
                child: Consumer<AuthProvider>(builder: (context, provider, x) {
                  return Form(
                      key: provider.signUpKey,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          CustomTextfield(
                            validation: provider.requiredValidation,
                            label: 'Name',
                            controller: provider.userNameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextfield(
                            validation: provider.phoneValidation,
                            label: 'Phone Number',
                            controller: provider.phoneController,
                            textInputType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextfield(
                            validation: provider.emailValidation,
                            label: 'Email',
                            controller: provider.registerEmailController,
                            textInputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextfield(
                            validation: provider.passwordValidation,
                            label: 'Password',
                            controller: provider.passwordRegisterController,
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                                                  TextButton(
              onPressed: () {
          AppRouter.appRouter
              .goToWidgetAndReplacement(signInScreen());
              },
              child: const Text(
          'Login',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
              ),
            ),
            Expanded(child: SizedBox()),
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 0, 0),
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                  
                                  // const Color(0xff4c505b),
                                 // Color(0xffd56561),
        backColor,
                                  child: IconButton(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    onPressed: () {
                                      provider.SignUp();
                                    },
                                    icon: const Icon(Icons.arrow_forward),
                                  ),
                                ),
             
             
             
             
             
             
             
             
             
             
             
             
             
             
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              
                              ),
                        ]),
                      ));
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

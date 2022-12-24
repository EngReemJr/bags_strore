import 'dart:html';

import 'package:firebase_start/providers/auth_providers.dart';

import '../component/costume_textfeild.dart';

class signInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ), // AppBar
      body: Container(
        padding: const EdgeInsets.all(20),
        child:
        Consumer<AuthProvider>(builder:(context,provider,x){
        return Form(
          key:provider.signInKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
          CustomTextfield(
            validation: provider.emailValidation(),
            label: 'Email',
            saveFun: provider.saveEmail()
          ),
          SizedBox(
            height: 20,
          ), // SizedBox CustomTextfield
          CustomTextfield(
 validation: provider.passwordValidation(),
 label: 'Password',
 saveFun: provider.savePassword()

          ),
          const spacer(),
          ElevatedButton(onPressed:(){

provider.signIn();

          },child:Text('Sign In')),
           sizedBox(height:10),
           ElevatedButton(onPressed:(){},child:Text('go to Sign up page')),
       
       
        ]
        
        
        ))}), // Column // Form
      ), // Container
    ); // Scaffold
  }
}

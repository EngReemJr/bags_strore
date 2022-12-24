import 'package: flutter/material.dart';
import 'package: string_validator/string_validator.dart';
import 'package:firebase_start/app_router/app_router.dart';
import 'package:firebase_start/auth/authHelper.dart';
class AuthProvider extends ChangeNotifier{ 
  

   GlobalKey<FormState> signInKey = GlobalKey();

   GlobalKey<FormState> signUpKey = GlobalKey();


late String email;
late String password;
saveEmail (String email) {
this.email=email;
}
savePassword (String password) {
this.password= password;
}

  String? emailValidation (String email) { if (email == null || email.isEmpty) {
}
return "Required field";
} else if (!(isEmail (email))) {
}
return "Incorrect email syntax";
String? passwordValidation (String password) { if (password == null || password.isEmpty) {
return "Required field";
}else if (password.length <= 6) {
}
return 'Error, the password must be larger than 6 lette';
}

SignIn() async{
if (signInkey.currentState!.validate()) { signInkey.currentState!.save();

bool? result =  await AuthHelper.HelperAuth.signIn(email, password);

}



}

SignUp() async{
if (signUpkey.currentState!.validate()) { signUpkey.currentState!.save();
bool? result = await AuthHelper.HelperAuth.signup(email, password);
}



}
SignOut(){}
}
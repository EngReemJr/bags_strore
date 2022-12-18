import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Function validation;
  final TextInputType textInputType;
  final bool isPassword;
  final String label;
  final TextEditingController controller;
  const CustomTextfield({
    Key? key,
    required this.validation,
    required this.label,
   this.isPassword=false,
   this.textInputType =TextInputType.text,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return TextFormField(
       keyboardType: textInputType,
       controller: controller,
       obscureText: isPassword
       ,
       //Key
        validator: (v) => validation(v),
        decoration: InputDecoration(
            label: Text(label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }
}

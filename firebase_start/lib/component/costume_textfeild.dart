import 'package: flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Function validation;
  final Function saveFun;
  final String label;
  const CustomTextfield({
    Key? key,
    required this.validation,
    required this.label,
    required this.saveFun
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return TextFormField(
      onSaved: (v)=>saveFun(v)
        validator: (v) => validation(v),
        decoration: InputDecoration(
            label: Text(label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))));
  }
}

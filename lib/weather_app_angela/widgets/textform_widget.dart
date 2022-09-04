import 'package:flutter/material.dart';

class  CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String fieldName;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final  ValueChanged onChanged;
  final FormFieldSetter onSaved;
  final ValueChanged onFieldSubmitted;

  const CustomTextField({
    Key? key,
    this.prefixIcon,
    this.labelText,
    required this.fieldName,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    required this.onChanged,required this.onSaved,required this.onFieldSubmitted

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Search must be not empty';
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
      onSaved:onSaved,
      onChanged: onChanged,
      controller:controller,
      keyboardType: textInputType,

      decoration: InputDecoration(
        //contentPadding: EdgeInsets.symmetric(horizontal: 4),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange,),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange,),
           borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        border: const OutlineInputBorder(),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.orange),
        hintText: hintText,
          prefixIcon: prefixIcon


      ),

    );
  }
}
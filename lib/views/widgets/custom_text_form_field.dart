import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.hintText, required this.iconWidget,this.onChanged, this.obscure = false});
  String? hintText;
  final Widget iconWidget;
  final bool? obscure;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return
      TextFormField (
        obscureText: obscure!,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onChanged,
      style: const TextStyle(fontSize: 22,color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: iconWidget,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(22))
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(22)))),
    );
  }
}

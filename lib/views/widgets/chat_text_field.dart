import 'package:flutter/material.dart';

import '../../constant.dart';
class ChatTextField extends StatelessWidget {
   ChatTextField({Key? key,  this.inSubmitted,this.textEditingController}) : super(key: key);
Function(String)? inSubmitted;
TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return   TextField (
      controller: textEditingController,
    onSubmitted: inSubmitted,
      style: const TextStyle(fontSize: 22,color: Colors.black),
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.send),
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: kPrimaryColor,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(22))
          ),
          hintText: 'Send Message',
          contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(22)))),
    );
  }
}
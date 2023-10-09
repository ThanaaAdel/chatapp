import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.textButton,this.method});
String textButton;
VoidCallback? method;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:method,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Center(child: Text(textButton,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}

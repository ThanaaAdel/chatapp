import 'package:flutter/material.dart';
import 'package:untitled/models/message_modal.dart';

import '../../constant.dart';
class BubbleChat extends StatelessWidget {
  const BubbleChat({Key? key, required this.message}) : super(key: key);
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 30, bottom: 30, right: 30),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32))),
        child:  Text(
          message.message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
class BubbleChatFriend extends StatelessWidget {
  const BubbleChatFriend({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 30, bottom: 30, right: 30),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
            color: Color(0xff006d84),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32))),
        child:  Text(
          message.message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
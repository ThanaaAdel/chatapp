import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/views/widgets/bubble_chat.dart';
import 'package:untitled/views/widgets/chat_text_field.dart';
import '../constant.dart';
import '../models/message_modal.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key, required this.email});
final String email;
  CollectionReference messages =
      FirebaseFirestore.instance.collection('message');

  TextEditingController controller = TextEditingController();

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt',descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length;i++) {
            messageList.add(Message.fromjson(snapshot.data!.docs[i]));
          }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('Scalar Chat'),
                centerTitle: true,
                backgroundColor: kPrimaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                       return messageList[index].id == email ?
                        BubbleChat(message: messageList[index]):
                            BubbleChatFriend(message:  messageList[index]);
                      }

                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ChatTextField(
                      textEditingController: controller,
                      inSubmitted: (data) {
                        messages.add({'message': data,'createdAt':DateTime.now(),'id':email});
                        controller.clear();
                        _scrollController.animateTo(
                         0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );

        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        return Text("loading");
      },
    );
  }
}

// ignore_for_file: avoid_print

import 'package:accompani/src/common_widgets/rive/rive.dart';
import 'package:accompani/src/features/core/models/chatroom_model.dart';
import 'package:accompani/src/features/core/screens/Inbox/providers/get_all_chats_provider.dart';
import 'package:accompani/src/features/core/screens/Inbox/widgets/chat_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatroomController chatroomController = Get.put(ChatroomController());

    return Obx(
      () {
        final List<ChatroomModel> chats = chatroomController.chatrooms.value.isNotEmpty
            ? chatroomController.chatrooms.value
            : [];

        if (chats.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RiveWidget(
                asset: 'assets/rive/error.riv',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50.0,),
              Text('No Chats Currently Available...', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
            ],
          );
        }

        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];

            final userId = chat.members.isNotEmpty
              ? chat.members.firstWhere(
                  (userId) => userId != FirebaseAuth.instance.currentUser!.uid,
                  orElse: () => 'FcbBjTIyPu4V8NlrInZj', 
                )
              : 'FcbBjTIyPu4V8NlrInZj';


            return ChatTile(
              userId: userId,
              lastMessage: chat.lastMessage,
              lastMessageTs: chat.lastMessageTs,
              chatroomId: chat.chatroomId,
            );
          },
        );
      },
    );

  }
}

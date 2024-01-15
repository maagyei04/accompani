import 'package:accompani/src/features/core/models/message_model.dart';
import 'package:accompani/src/features/core/screens/Inbox/widgets/message_content.dart';
import 'package:accompani/src/features/core/screens/Inbox/widgets/round_profile_pic.dart';
import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final MessageModel message;

  const ReceivedMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyProfilePic(userId: message.senderId),
          const SizedBox(width: 15),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 72, 72, 72),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: MessageContents(message: message),
            ),
          ),
        ],
      ),
    );
  }
}

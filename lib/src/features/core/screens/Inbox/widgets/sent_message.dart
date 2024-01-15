import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/core/models/message_model.dart';
import 'package:accompani/src/features/core/screens/Inbox/widgets/message_content.dart';
import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  final MessageModel message;

  const SentMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 15),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: tPrimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Wrap(
                children: [
                  MessageContents(
                    message: message,
                    isSentMessage: true,
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    message.seen ? Icons.done_all : Icons.check,
                    color: tWhiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/core/models/message_model.dart';
import 'package:accompani/src/features/core/screens/Inbox/widgets/post_image_video_view.dart';
import 'package:flutter/material.dart';

class MessageContents extends StatelessWidget {
  const MessageContents({
    super.key,
    required this.message,
    this.isSentMessage = false,
  });

  final MessageModel message;
  final bool isSentMessage;

  @override
  Widget build(BuildContext context) {
    if (message.messageType == 'text') {
      return Text(
        message.message,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: isSentMessage ? tWhiteColor : tWhiteColor,
        ),
      );
    } else {
      return PostImageVideoView(
        fileUrl: message.message,
        postType: message.messageType,
      );
    }
  }
}
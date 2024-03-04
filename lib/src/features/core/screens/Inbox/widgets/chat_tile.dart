
import 'package:accompani/src/common_widgets/rive/rive.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/core/screens/Inbox/chat_detail.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.userId,
    required this.lastMessage,
    required this.lastMessageTs,
    required this.chatroomId,
  });

  final String userId;
  final String lastMessage;
  final DateTime lastMessageTs;
  final String chatroomId;

  @override
  Widget build(BuildContext context) {
    final userInfoController = Get.put(UserRepository());

    return FutureBuilder<UserModel>(
      future: userInfoController.getUserInfoById(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: RiveWidget(
              asset: 'assets/rive/loading.riv',
              width: 10,
              height: 10,
            ),
          ); // Replace with a suitable widget for the loading state
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: RiveWidget(
              asset: 'assets/rive/error.riv',
              width: 10,
              height: 10,
            ),
          );
        }

        final user = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: InkWell(
            onTap: () {
              Get.to(() => ChatDetail(userId: userId,), arguments: user.firstName);
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: tSecondaryColor,
                  backgroundImage: user.photos[0].isNotEmpty 
                          ? NetworkImage(user.photos[0])
                          : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         user.firstName, 
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              lastMessage,
                              style: const TextStyle(color: tSecondaryColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(Icons.arrow_right_outlined),
                          Text(
                            '${lastMessageTs.minute} min ago...',
                            style: const TextStyle(color: tSecondaryColor),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePic extends StatelessWidget {
  const MyProfilePic({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(UserRepository());

    return FutureBuilder<UserModel>(
      future: profileController.getUserInfoById(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircleAvatar(
            radius: 20,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const CircleAvatar(
            radius: 20,
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          final UserModel user = snapshot.data!; // Assuming you want the first user from the list

          return GestureDetector(
            onTap: () {
              // Handle onTap action
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.photos[0]),
            ),
          );
        } else {
          return const CircleAvatar(
            radius: 20,
            child: Text('No Data'),
          );
        }
      },
    );
  }
}

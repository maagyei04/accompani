import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          const Center(
            child: Image(image: AssetImage(tAppLogoImage)),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              child: const Text("Logout"),
            ),
          )
        ],
      ),
    );
  }
}
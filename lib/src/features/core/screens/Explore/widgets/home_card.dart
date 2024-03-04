// ignore_for_file: avoid_print

import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/core/screens/Inbox/chat.dart';
import 'package:accompani/src/features/core/screens/Inbox/chat_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.widthSize,
    required this.heightSize,
    required this.picture,
    required this.name,
    required this.rank,
    required this.rate,
    required this.bio,
    required this.userId,
  });

  final double widthSize;
  final double heightSize;
  final String picture;
  final String name;
  final String rank;
  final String rate;
  final String bio;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: tDarkColor,
            borderRadius: BorderRadius.circular(15),
          ),
          width: widthSize,
          height: heightSize / 1.5,
          margin: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              picture,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print("Error loading image: $error");
                return const Text("Error loading image");
              },
            ),
          ),
        ),         
               Positioned(
                bottom: 60,
                left: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(name, style: Theme.of(context).textTheme.titleLarge,),
                          const Icon(Icons.verified, color: Colors.yellow,),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.theater_comedy, color: Colors.yellow,),
                          Text(rank, style: Theme.of(context).textTheme.labelLarge,),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow,),
                          Text(rate, style: Theme.of(context).textTheme.labelLarge,),
                        ],
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(bio,  style: Theme.of(context).textTheme.titleSmall,))
                    ],
                  ),
                )
              ),                
              const Positioned(
                top: 35,
                left: 35,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.yellow,
                )
              ),                         
              Positioned(
                top: 40,
                left: 40,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.yellow,
                  backgroundImage: NetworkImage(picture),
                )
              ),   
              Positioned(
                bottom: 30,
                right: 30,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: tPrimaryColor,
                  child: IconButton(onPressed: () {
                    Get.to(() => ChatDetail(userId: userId));
                  }, icon: const Icon(Icons.send, color: tWhiteColor, size: 30.0,),)
                  
                  
                )
              ),                                     
    
      ],
    );
  }
}
import 'package:accompani/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.widthSize,
    required this.name,
    required this.userType,
    this.picture,
  });

  final double widthSize;
  final String name;
  final String userType;
  final NetworkImage? picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: widthSize,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              Row(
                children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: tSecondaryColor,
                  backgroundImage: picture!,
                ),
              const SizedBox(width: 15.0,),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(name, style: Theme.of(context).textTheme.displayLarge,),
                      Text(userType),
                    ],
                  ),                                                ],
              ),
            ],
          ),
                    const Icon(Icons.edit_note_outlined, size: 40,),
        ],
      ),
    );
  }
}
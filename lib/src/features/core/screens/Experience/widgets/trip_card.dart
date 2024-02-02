import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.widthSize,
    required this.description,
    required this.title,
    required this.name,
    required this.verified,
  });

  final double widthSize;
  final String description;
  final String title;
  final String name;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      width: widthSize,
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.displayLarge,),
          const SizedBox(height: 10.0,),
          Text(description, style: Theme.of(context).textTheme.displayMedium,),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 15.0,
              ),
              const SizedBox(width: 10.0,),
              Text(name, style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(width: 10.0,),
              verified
               ? const Icon(Icons.verified, color: Colors.yellow,)
               : const Icon(Icons.arrow_circle_right_outlined, color: Colors.yellow,),
            ],
          )
        ],
      ),
    );
  }
}
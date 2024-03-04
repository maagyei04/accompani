import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.widthSize,
    required this.review,
    required this.name,
    required this.time,
  });

  final double widthSize;
  final String review;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: widthSize - 40,
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(review, softWrap: true, maxLines: 6, style: Theme.of(context).textTheme.displayMedium,),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30.0,
              ),
              const SizedBox(width: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.displayLarge,),
                  Text(time, style: Theme.of(context).textTheme.displayMedium,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
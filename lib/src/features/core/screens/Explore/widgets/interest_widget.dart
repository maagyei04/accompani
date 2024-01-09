import 'package:accompani/src/constants/colors.dart';
import 'package:flutter/material.dart';

class InterestWidget extends StatelessWidget {
  const InterestWidget({
    super.key, required this.interest,
  });

  final String interest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 108, 4),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        interest,
        style: const TextStyle(
          color:tWhiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
      ),
    );
  }
} 
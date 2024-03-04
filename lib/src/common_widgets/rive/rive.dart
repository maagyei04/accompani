import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveWidget extends StatelessWidget {
  final String asset;

  const RiveWidget({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: RiveAnimation.asset(
            asset,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveWidget extends StatelessWidget {
  final String asset;
  final double width;
  final double height;

  const RiveWidget({super.key, required this.asset, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RiveAnimation.asset(
        asset,
        fit: BoxFit.contain,
      ),
    );
  }
}
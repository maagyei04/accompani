import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Color color;
  final Widget icon;
  const CustomIcon({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
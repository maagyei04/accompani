import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class RiveWidget extends StatelessWidget {
  final String asset;

  const RiveWidget({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RiveAnimation.asset(
        asset,
      )
    );
  }
}
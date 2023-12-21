import 'package:accompani/src/constants/text_strings.dart';
import 'package:flutter/material.dart';


class SignupHeaderWidget extends StatelessWidget {
  const SignupHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tLoginTitle, style: Theme.of(context).textTheme.bodyLarge,),
        Text(tSignupSubTitle, style: Theme.of(context).textTheme.displayMedium,),

      ],
    );
  }
}
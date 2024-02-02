import 'package:accompani/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonLoadingWidget2 extends StatelessWidget {
  const ButtonLoadingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: tWhiteColor,),
        ),
        SizedBox(width: 10,),
        Text('Loading...')
      ],
    );
  }
}
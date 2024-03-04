import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonTile extends StatelessWidget {
  const ButtonTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border:Border.all(
          color: Colors.grey,
          width: 1.0,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.displayMedium,),
          const Icon(Icons.arrow_forward_ios_rounded, size: 10.0,)
        ],
      ),
    );
  }
}
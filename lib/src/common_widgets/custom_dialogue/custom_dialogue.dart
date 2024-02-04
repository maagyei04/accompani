import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final widget;

  const CustomDialog({super.key, required this.title, required this.content, this.widget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.displayLarge),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            widget!;
          },
          child: const Text('Confirm'),
        ),
        const SizedBox(width: 20.0,),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
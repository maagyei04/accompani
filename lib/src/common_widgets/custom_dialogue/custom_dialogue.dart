import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final Widget? widget;
  final Function()? onConfirm;

  const CustomDialog({super.key, required this.title, required this.content, this.widget, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.displayLarge),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            if (widget != null) {
              Get.back(); // Close the dialog
              Get.off(widget!);
            }
            if (onConfirm != null) {
              Get.back(); // Close the dialog
              onConfirm!(); // Call the provided callback
            }
          },
          child: const Text('Confirm'),
        ),
        const SizedBox(width: 20.0,),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
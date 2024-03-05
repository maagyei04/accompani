import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonTile extends StatelessWidget {
  const ButtonTile({
    super.key,
    required this.title,
    this.icon,
    this.screen,
  });

  final String title;
  final Widget? icon;
  final Widget? screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => screen!);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border:Border.all(
            color: Colors.white,
            width: 1.0,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon!,
                const SizedBox(width: 15.0,),
                Text(title, style: Theme.of(context).textTheme.displayMedium,), 
              ],
       
            ),
      
            const Icon(Icons.arrow_forward_ios_rounded, size: 10.0, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
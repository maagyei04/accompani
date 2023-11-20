import 'package:flutter/material.dart';

class MultipleImageUpload extends StatelessWidget {
  const MultipleImageUpload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          // Left Container
          Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 180, 180, 180),
      borderRadius: BorderRadius.circular(10.0)
    ),
    width: MediaQuery.of(context).size.width * 0.5, 
    height: 200,
    margin: const EdgeInsets.only(right: 10.0), 
    child: IconButton(
      icon: const Icon(Icons.add_a_photo_outlined), 
      onPressed: () {},
    ),
          ),
          // Right Column of Containers
          Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 180, 180, 180),
            borderRadius: BorderRadius.circular(10.0)
          ),
          width: double.infinity,
          height: 95,
          margin: const EdgeInsets.only(bottom: 10.0),
          child: IconButton(
            icon: const Icon(Icons.add_a_photo_outlined), 
            onPressed: () {},
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 180, 180, 180),
            borderRadius: BorderRadius.circular(10.0)
          ),
          width: double.infinity,
          height: 95,
          child: IconButton(
            icon: const Icon(Icons.add_a_photo_outlined), 
            onPressed: () {},
          ),
        ),
      ],
    ),
          ),
        ],
      ),
    );
  }
}

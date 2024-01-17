import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/destination_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayContainer extends StatelessWidget {
  const OverlayContainer({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Get.to(() => const DestinationSelectionScreen());
        },
        child: Container(
          decoration: BoxDecoration(
            color: tDarkColor,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 150,
          margin: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: // Adjust opacity as needed
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
              ),                             
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
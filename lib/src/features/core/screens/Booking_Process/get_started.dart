import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/survey.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetTripStarted extends StatelessWidget {
  const GetTripStarted({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;
    var heightSize = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text("Experience", style: Theme.of(context).textTheme.displayLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Plan And Organize Your Experience In Few Steps', style: Theme.of(context).textTheme.headlineLarge,),
              Text('Follow these steps to book your Compani in few minutes...', style: Theme.of(context).textTheme.bodySmall,),
            Container(
              decoration: BoxDecoration(
                color: tDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              width: widthSize,
              height: heightSize / 2.5,
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: const Image(image: AssetImage(tWelcomeImage3), fit: BoxFit.cover,),
              ),
            ),
              const Row(
                children: [
                  Icon(Icons.verified_rounded, color: tPrimaryColor,),
                  SizedBox(width: 30.0,),
                  Text('Pick Duration')
                ],
          
              ),
              const Row(
                children: [
                  Icon(Icons.verified_rounded, color: Colors.grey,),
                  SizedBox(width: 30.0,),
                  Text('Select main activity')
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.verified_rounded, color:  Colors.grey,),
                  SizedBox(width: 30.0,),
                  Text('Pick your Destination')
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.verified_rounded, color:  Colors.grey,),
                  SizedBox(width: 30.0,),
                  Text('Book a Host')
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.verified_rounded, color:  Colors.grey,),
                  SizedBox(width: 30.0,),
                  Text('Payment')
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () {
            Get.to(() => const TripDetailsScreen());
          }, child: const Text('Get Started')),
        ),
      ),
    );
  }
}
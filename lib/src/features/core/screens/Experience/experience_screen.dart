import 'package:accompani/src/features/core/screens/Booking_Process/get_started.dart';
import 'package:accompani/src/features/core/screens/Experience/widgets/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Trips", style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TripCard(
              widthSize: widthSize,
              description: "Nestled among snow-capped mountains, Snowflake Valley is a picturesque retreat that transforms into a magical haven during the holiday season.",
              title: 'Business Trip',
              name: "Emily Todd",
              verified: true,
            ),
            TripCard(
              widthSize: widthSize,
              description: "Nestled among snow-capped mountains, Snowflake Valley is a picturesque retreat that transforms into a magical haven during the holiday season.",
              title: 'Christmas Holidays',
              name: "Emilly Todd",
              verified: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const GetTripStarted());
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_rounded),
                            SizedBox(width: 10.0,),
                            Text('Create A New Trip', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        )
                        
                      ),
                    ),
    ));
  }
}
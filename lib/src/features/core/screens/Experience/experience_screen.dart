// ignore_for_file: avoid_print

import 'package:accompani/src/features/core/screens/Booking_Process/get_started.dart';
import 'package:accompani/src/features/core/screens/Experience/widgets/trip_card.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;

    final controller = Get.put(UserRepository());
    final AuthenticationRepository authController = Get.put(AuthenticationRepository());

    return FutureBuilder(
      future: controller.getUserTrips(authController.getUserID),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: SizedBox(
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
                      ),
          );
        }

        final trip = snapshot.data!;
        
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
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: trip.length,
                  itemBuilder: (_, index) {
                    return  TripCard(
                      widthSize: widthSize,
                      description: trip[index].description,
                      title: trip[index].title,
                      name: trip[index].host,
                      verified: true,
                    );
                  },

                ) 
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
        
  });
    
    
  }
}
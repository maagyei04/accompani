import 'package:accompani/src/common_widgets/rive/rive.dart';
import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/models/trip_model.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/book_request.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/widgets/host_available_card.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableHosts extends StatelessWidget {
  AvailableHosts({super.key});

  final trip = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var screenWidth = mediaQuery.width;

    final controller = Get.put(UserRepository());

    return FutureBuilder(
      future: controller.getAllUserInfoByType(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: RiveWidget(asset: 'assets/rive/loading.riv'),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: Column(
              children: [
                RiveWidget(asset: 'assets/rive/error.riv'),
                SizedBox(height: 8,),
                Text('No Host Available At The Moment...')
              ]
            )
            
          ); 
        }

        final user = snapshot.data!;



      return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Get.back(); }
        , icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        centerTitle: true,
        title: const Text('Available Hosts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: Column(
            children: [
              TSearchContainer(width: screenWidth, text: 'New York'),
              const SizedBox(height: 10.0,),
              InkWell(
                onTap: () {
                                final tripp = TripModel(
                                  title:trip.title,
                                  description: trip.description,
                                  activity: trip.activity,
                                  destination: trip.destination,
                                  arrivalDate: trip.arrivalDate,
                                  cost: trip.cost,
                                  guestAdded: trip.guestAdded,
                                  status: trip.status,
                                  purpose: trip.purpose,
                                  host: user[0].userId!,
                                  duration: trip.duration,
                                );

                  Get.to(() => BookRequestScreen(), arguments: tripp);
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: user.length,
                  itemBuilder: (_, index) {
                    return HostCard(
                      userId: user[index].userId!,
                      screenWidth: screenWidth,
                      name: user[index].firstName + user[index].lastName,
                      review: '24 Reviews',
                      rank: user[index].rank!,
                      rate: user[index].reviewRate!,
                      bio: user[index].bio,
                      hostTimeJoined: '2 months hosting',
                    );
                  },

                )
                
              ),
                          ],
          ),
        ),
      ),
    );
      }
    );
   
  }
}
import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/book_request.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/widgets/host_available_card.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableHosts extends StatelessWidget {
  const AvailableHosts({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var screenWidth = mediaQuery.width;

    final controller = Get.put(UserRepository());

    return FutureBuilder(
      future: controller.getAllUserInfoByType(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Replace with a suitable widget for the loading state
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: Text('No Host Available At The Moment...')
          ); // Replace with a suitable error widget
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
                  Get.to(() => const BookRequestScreen());
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
                      hostTimeJoined: '1 year hosting',
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
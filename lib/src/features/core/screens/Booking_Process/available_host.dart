import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/book_request.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/widgets/host_available_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableHosts extends StatelessWidget {
  const AvailableHosts({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var screenWidth = mediaQuery.width;



    return Scaffold(
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
                child: HostCard(
                  screenWidth: screenWidth,
                  name: 'Emily Todd',
                  review: '24 Reviews',
                  rank: 'SuperHost',
                  rate: '4.78',
                  bio: "Hello! I'm Emily, a passionate explorer with an insatiable curiosity for the world around me. Whether it's traversing through dense jungles, unraveling historical mysteries",
                  hostTimeJoined: '1 year hosting',
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const BookRequestScreen());
                },
                child: HostCard(
                  screenWidth: screenWidth,
                  name: 'Emily Todd',
                  review: '24 Reviews',
                  rank: 'SuperHost',
                  rate: '4.78',
                  bio: "Hello! I'm Emily, a passionate explorer with an insatiable curiosity for the world around me. Whether it's traversing through dense jungles, unraveling historical mysteries",
                  hostTimeJoined: '1 year hosting',
                ),
              ),
              
                          ],
          ),
        ),
      ),
    );
  }
}
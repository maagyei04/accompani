import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/common_widgets/custom_dialogue/custom_dialogue.dart';
import 'package:accompani/src/common_widgets/rive/rive.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/booking_complete.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/widgets/host_available_card.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/home_card.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookRequestScreen extends StatelessWidget {
  BookRequestScreen({super.key});

  final trip = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var screenWidth = mediaQuery.width;
    final controller = Get.put(UserRepository());

    return FutureBuilder(
      future: controller.getUserInfoById(trip.host),
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
                Text('Host Not Available At The Moment...')
              ]
            )
            
          ); 
        }

        final user = snapshot.data!;
        
        
      return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Get.back();}, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Request To Book', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              HostCard(
                userId: user.id! ?? 'Default',
                screenWidth: screenWidth,
                name: '${user.firstName} ${user.lastName}',
                review: '24 Reviews',
                rank: user.rank! ?? 'Default',
                rate: user.reviewRate! ?? 'Default',
                bio: user.bio,
                hostTimeJoined: '2 month hosting',
              ),
              
              const SizedBox(height: 10.0,),
              Text('Selected Activities', style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 10.0,),

              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0, color: Colors.grey,),
                ),
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Learn & Explore Category', style: Theme.of(context).textTheme.labelMedium,),
                        Row(
                          children: [
                            Text('Selected Activity: ', style: Theme.of(context).textTheme.bodySmall,),
                    Container(
                            padding: const EdgeInsets.all(9.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              trip.activity,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ), 
                                                  ],
                        )
                      ],
                    ),
                    ElevatedButton(onPressed: () {
                      //
                    }, child: const Text('Edit'),)
                  ],
                ),
              ),

              const SizedBox(height: 15.0,),


              Text('Details', style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 10.0,),

              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0, color: Colors.grey,),
                ),
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date', style: Theme.of(context).textTheme.labelMedium,),
                        Text(trip.duration, style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    ),
                    ElevatedButton(onPressed: () {
                      //
                    }, child: const Text('Edit'),)
                  ],
                ),
              ),

              const SizedBox(height: 15.0,),

              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0, color: Colors.grey,),
                ),
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location', style: Theme.of(context).textTheme.labelMedium,),
                        Text(trip.destination, style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    ),
                    ElevatedButton(onPressed: () {
                      //
                    }, child: const Text('Edit'),)
                  ],
                ),
              ),

              const SizedBox(height: 15.0,),              


              Text('Rates', style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 10.0,),

              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0, color: Colors.grey,),
                ),
                width: screenWidth,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$79 * 5', style: Theme.of(context).textTheme.bodySmall,),
                            Text('Taxes', style: Theme.of(context).textTheme.bodySmall,)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$395.00', style: Theme.of(context).textTheme.bodySmall,),
                            Text('\$16.00', style: Theme.of(context).textTheme.bodySmall,)
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total', style: Theme.of(context).textTheme.bodySmall,),
                        Text('\$411.00', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(tDefaultSize - 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      OutlinedButton(onPressed: () {
                        _showCustomDialog(context);
                      }, child:  const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Cancel'),
                      ),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            UserRepository.instance.createTrip(trip);
                            Get.offAll(() => const BookingComplete());
                          }, 
                          child: const Text('Request To Book')
                        ),
                      ),
                    ],
                  ),
                ),
              ) ,    );
  });
  }
}

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomDialog(
          title: 'Booking Accompani',
          content: 'Are you sure you want to cancel Booking a local guide?',
          widget: NavigationMenu(),
        );
      },
    );
  }
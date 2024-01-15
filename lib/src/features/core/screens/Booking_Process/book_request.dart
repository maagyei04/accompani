import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/widgets/host_available_card.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/home_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookRequestScreen extends StatelessWidget {
  const BookRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var screenWidth = mediaQuery.width;

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
                userId: FirebaseAuth.instance.currentUser!.uid,
                screenWidth: screenWidth,
                name: 'Emily Todd',
                review: '24 Reviews',
                rank: 'SuperHost',
                rate: '4.78',
                bio: "Hello! I'm Emily, a passionate explorer with an insatiable curiosity for the world around me. Whether it's traversing through dense jungles, unraveling historical mysteries",
                hostTimeJoined: '1 year hosting',
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
                            child: const Text(
                              'Cooking',
                              style: TextStyle(
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
                        Text('1 - 10 Sept', style: Theme.of(context).textTheme.bodySmall,)
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
                        Text('New York, USA', style: Theme.of(context).textTheme.bodySmall,)
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
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      OutlinedButton(onPressed: () {
                        Get.offAll(() => const NavigationMenu());
                      }, child:  const Text('Cancel'),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            //
                          }, 
                          child: const Text('Request To Book')
                        ),
                      ),
                    ],
                  ),
                ),
              ) ,    );
  }
}
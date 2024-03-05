// ignore_for_file: avoid_print

import 'package:accompani/src/common_widgets/categories/vertical_categories.dart';
import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/controllers/guest_controller.dart';
import 'package:accompani/src/features/core/controllers/date_range_controller.dart';
import 'package:accompani/src/features/core/models/trip_model.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/available_host.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DestinationSelectionScreen extends StatelessWidget {
  DestinationSelectionScreen({super.key});

  final trip = Get.arguments;

  @override
  Widget build(BuildContext context) {
  var mediaQuery = MediaQuery.of(context).size;
  var screenWidth = mediaQuery.width;
  var screenHeight = mediaQuery.height;


  final GuestController controller = Get.put(GuestController());
  final controller2 = Get.put(UserRepository());
  final DateRangeController dateRangeController = Get.put(DateRangeController());

  print(trip);

  
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Get.back(); }, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Select Your Destination', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: Column(
            children: [
              const Text('Where is your next destination...?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: tDarkColor),),
              const SizedBox(height: 10.0,),
              TSearchContainer(width: screenWidth, text: 'Search Your Destination'),
              const SizedBox(height: 10.0,),
                SizedBox(
                  height: 220.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final isSelected = index == controller.selectedContainerIndex.value;
                
                      return Column(
                        children: [
                            InkWell(
                              onTap: () {
                                controller.selectContainer(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 130,
                                height: 130,
                                margin: const EdgeInsets.all(20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
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
                                            child: const Image(
                                              image: AssetImage(tWelcomeImage2),
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
                                          child: const Text(
                                            'New York, USA',
                                            style: TextStyle(
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
                            ),
                        ],
                      );
                    },
                  ),
                ), 

                  GestureDetector(
                    onTap: () {
                      dateRangeController.selectDateRange();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Obx(() {
                        String formattedStartDate = DateFormat('d MMM yyyy', 'en').format(dateRangeController.startDate.value);
                        String formattedEndDate = DateFormat('d MMM yyyy', 'en').format(dateRangeController.endDate.value);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Trip Duration: $formattedStartDate - $formattedEndDate', style: Theme.of(context).textTheme.labelMedium),
                            const Icon(Icons.calendar_month_rounded)
                          ],
                        );
                      }),
                    ),
                  ),
                       
                  const SizedBox(height: 20.0,),

                TextFormField(
                  controller: controller.textEditingController,
                  onFieldSubmitted: (text) {
                    controller.addToTopOfGuestList(text);
                  },
                  style: const TextStyle(fontSize: 15.0),
                  decoration: const InputDecoration(
                    labelText: 'Add Guests',
                    hintText: 'Input the email of guest and press Enter...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ), 
              const SizedBox(height: 10,),

                 Obx(
                   () => SizedBox(
                    height: 50,
                    child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.guestList.length, 
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return TVerticalCategories(
                        backgroundColor: tPrimaryColor,
                        textColor: tWhiteColor,
                        title: controller.guestList[index],
                        onTap: (){
                          controller.removeFromGuestList(controller.guestList[index]);
                        },
                      );
                      
                    }),
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
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){

                              String formattedStartDate = DateFormat('d MMM yyyy', 'en').format(dateRangeController.startDate.value);
                              String formattedEndDate = DateFormat('d MMM yyyy', 'en').format(dateRangeController.endDate.value);                

                              final tripp = TripModel(
                                  title:trip.title,
                                  description: trip.description,
                                  activity: trip.activity,
                                  destination: 'New York, USA',
                                  arrivalDate: formattedStartDate,
                                  cost: trip.cost,
                                  guestAdded: controller.guestList,
                                  status: 'Pending',
                                  purpose: trip.purpose,
                                  host: trip.host,
                                  duration: '$formattedStartDate - $formattedEndDate',
                  
                                );
                  
                              Get.to(() => AvailableHosts(), arguments: tripp);
                            
                          },
                          child: const Text('Next')
                        ),
                      )
                    ],
                  ),
                ),
              ) ,   
           );
      }
}
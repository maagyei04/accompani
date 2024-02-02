import 'package:accompani/src/common_widgets/categories/vertical_categories.dart';
import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/auth/controllers/guest_controller.dart';
import 'package:accompani/src/features/core/controllers/date_range_controller.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/available_host.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestinationSelectionScreen extends StatelessWidget {
  DestinationSelectionScreen({super.key});

  final text = Get.arguments;

  @override
  Widget build(BuildContext context) {
  var mediaQuery = MediaQuery.of(context).size;
  var screenWidth = mediaQuery.width;
  var screenHeight = mediaQuery.height;

  final GuestController controller = Get.put(GuestController());
  final DateRangeController dateRangeController = Get.put(DateRangeController());

  
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
                height: 210.0,
                child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 7, 
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: tDarkColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 130,
                                height: 130,
                                margin: const EdgeInsets.all(20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: const Image(image: AssetImage(tWelcomeImage3), fit: BoxFit.cover,),
                                ),
                              ),  
                              const Text('New York'),
                                                  ],
                          );
                          
                  }),
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
                        border:Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text('Selected Trip Duration: ${dateRangeController.startDate.value.day} - ${dateRangeController.endDate.value.day}', style: Theme.of(context).textTheme.displayMedium,)),
                          const Icon(Icons.calendar_month_rounded)
                        ],
                      ),
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
                            Get.to(() => const AvailableHosts());
                          },
                          child: const Text('Next')
                        ),
                      )
                    ],
                  ),
                ),
              ) ,    );
  }
}
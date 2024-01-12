import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/destination_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalsScreen extends StatelessWidget {
  const LocalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Survey - Locals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: Column(
            children: [
              const Text('What are you looking to do...', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: tDarkColor),),
              const SizedBox(height: 10.0,),
              TSearchContainer(width: widthSize, text: 'Search Tour Guide'),
              const SizedBox(height: 10.0,),
              SizedBox(width: double.infinity,
                child: Row(
                  children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const DestinationSelectionScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tDarkColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 130,
                            margin: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Image(image: AssetImage(tWelcomeImage3), fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ), 
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const DestinationSelectionScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tDarkColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 130 ,
                            margin: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Image(image: AssetImage(tWelcomeImage2), fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),                  ],
                ),
              ),
              SizedBox(width: double.infinity,
                child: Row(
                  children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const DestinationSelectionScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tDarkColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 130,
                            margin: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Image(image: AssetImage(tWelcomeImage), fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ), 
                ],
                ),
              ),              SizedBox(width: double.infinity,
                child: Row(
                  children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const DestinationSelectionScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tDarkColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 130,
                            margin: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Image(image: AssetImage(tWelcomeImage4), fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ), 
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const DestinationSelectionScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tDarkColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 130 ,
                            margin: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Image(image: AssetImage(tWelcomeImage3), fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),                  ],
                ),
              ),            ],
          ),
        ),
      ),
    );
  }
}
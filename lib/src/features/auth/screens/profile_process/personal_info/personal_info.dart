// ignore_for_file: avoid_print

import 'package:accompani/src/common_widgets/categories/vertical_categories.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/language_controller.dart';
import 'package:accompani/src/features/auth/controllers/proccess_controller.dart';
import 'package:accompani/src/features/auth/models/personal_info_model.dart';
import 'package:accompani/src/features/auth/screens/profile_process/personal_info/widgets/multiple_image_upload.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController controller = Get.put(LanguageController());
    final controller2 = Get.put(AuthenticationRepository());

    final controller6 = Get.put(UserRepository());
    final ProcessController stepController = Get.find();


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
        
              const Text('Upload Your Photos',style: TextStyle(fontWeight: FontWeight.bold),),
        
              const SizedBox(height: 5,),
        
              const MultipleImageUpload(),
        
              const SizedBox(height: 5,),

              const Text('Languages You Speak',style: TextStyle(fontWeight: FontWeight.bold),),
              const Text('Input the languages you speak',style: TextStyle(fontSize: 12),),
              const Text('Press Enter after every language you input',style: TextStyle(fontSize: 12),),

              const SizedBox(height: 10,),

                TextFormField(
                  controller: controller.textEditingController,
                  onFieldSubmitted: (text) {
                    controller.addToTopOfList(text);
                  },
                  style: const TextStyle(fontSize: 15.0),
                  decoration: const InputDecoration(
                    labelText: 'Input Languages',
                    hintText: 'Input the languages you speak with \',\' seperating them',
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
                    itemCount: controller.languageList.length, 
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return TVerticalCategories(
                        backgroundColor: tPrimaryColor,
                        textColor: tWhiteColor,
                        title: controller.languageList[index],
                        onTap: (){},
                      );
                      
                    }),
                                   ),
                 ),

              const Text('Your Bio',style: TextStyle(fontWeight: FontWeight.bold),),
        
              const SizedBox(height: 10,),

                TextFormField(
                  style: const TextStyle(fontSize: 15.0),
                  controller: controller.bio,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: 'About You',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),  
     
            ]
          ),
        ),
      ),
      bottomNavigationBar: 
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: (){
                            stepController.nextPage();
                          }, 
                          child: const Text(tSkip)
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              List<String> imageUrls = await Future.wait([
                                controller6.uploadPostImage(),
                                controller6.uploadPostImage2(),
                                controller6.uploadPostImage3(),
                              ]);

                              String imageUrl = imageUrls[0];
                              String imageUrl2 = imageUrls[1];
                              String imageUrl3 = imageUrls[2];

                              final user = PersonalInfoModel(
                                id: controller2.getUserID,
                                languages: controller.languageList,
                                bio: controller.bio.text.trim(),
                                photos: [
                                  if (imageUrl != null && imageUrl.isNotEmpty) imageUrl,
                                  if (imageUrl2 != null && imageUrl2.isNotEmpty) imageUrl2,
                                  if (imageUrl3 != null && imageUrl3.isNotEmpty) imageUrl3,
                                ],
                              );

                              await controller6.updatePersonalRecord(user);

                              stepController.nextPage();
                            } catch (e) {
                              Get.snackbar(
                                "Error",
                                "Error during image upload or update: $e",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.redAccent.withOpacity(0.1),
                                colorText: Colors.red,
                                duration: const Duration(seconds: 5),
                              ); 
                            }
                          },

                          child: const Text(tNext)
                        ),
                      )
                    ],
                  ),
                ),
              ) ,
    );
  }
}
import 'dart:io';

import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/image_picker_controller%20_2.dart';
import 'package:accompani/src/features/auth/controllers/image_picker_controller.dart';
import 'package:accompani/src/features/auth/controllers/image_picker_controller_3.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_options/forgot_password_btn_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleImageUpload extends StatelessWidget {
  const MultipleImageUpload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());
    final controller2 = Get.put(ImagePickerController2());
    final controller3 = Get.put(ImagePickerController3());


    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          // Left Container
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      // -- coming
                    },              
                                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 180, 180, 180),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  width: MediaQuery.of(context).size.width * 0.5, 
                  height: 200,
                  margin: const EdgeInsets.only(right: 10.0), 
                  child:  kIsWeb ?
                        controller.image.value.path == ''
                          ? IconButton(
                    icon: const Icon(Icons.add_a_photo_outlined), 
                    onPressed: () {
                      showModalBottomSheet(
                    context: context, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tFormHeight - 10),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                            Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                            const SizedBox(height: tFormHeight,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.camera_enhance_rounded,
                              title: 'Camera',
                              subTitle: 'Take live image',
                              onTap: () {
                                Navigator.pop(context);
                                controller.pickImageCamera();
                              },
                            ),
                            const SizedBox(height: tFormHeight - 10,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.photo_album_rounded,
                              title: 'Gallery',
                              subTitle: 'Select from Gallery',
                              onTap: () {
                                Navigator.pop(context);
                                controller.pickImage();                          },
                            ),
                          ]
                        ),
                      )
                    ),
                  );
                    },
                  )
                  
                  
                          :  Image.network(
                              controller.image.value.path, fit: BoxFit.cover,
                            ) 
                                
                            :
                                
                        controller.image.value.path == ''
                          ?  IconButton(
                icon: const Icon(Icons.add_a_photo_outlined), 
                onPressed: () {
                   showModalBottomSheet(
                  context: context, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(tFormHeight - 10),
                  ),
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                          Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                          const SizedBox(height: tFormHeight,),
                          ForgotPasswordBtnWidget(
                            btnIcon: Icons.camera_enhance_rounded,
                            title: 'Camera',
                            subTitle: 'Take live image',
                            onTap: () {
                              Navigator.pop(context);
                              controller.pickImageCamera();
                            },
                          ),
                          const SizedBox(height: tFormHeight - 10,),
                          ForgotPasswordBtnWidget(
                            btnIcon: Icons.photo_album_rounded,
                            title: 'Gallery',
                            subTitle: 'Select from Gallery',
                            onTap: () {
                              Navigator.pop(context);
                              controller.pickImage();                          },
                          ),
                        ]
                      ),
                    )
                  ),
                );
                },
              )
                          : Image.file(
                            File(controller.image.value.path), fit: BoxFit.cover,
                          ),
                   
                                ),
                              ),
                ),

          // Right Column of Containers
          Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      
                    },            
                              child: Container(
                                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 180, 180, 180),
                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                width: double.infinity,
                                height: 95,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                child:  kIsWeb ?
                        controller2.image.value.path == ''
                          ? IconButton(
                  icon: const Icon(Icons.add_a_photo_outlined), 
                  onPressed: () {
                    showModalBottomSheet(
                    context: context, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tFormHeight - 10),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                            Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                            const SizedBox(height: tFormHeight,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.camera_enhance_rounded,
                              title: 'Camera',
                              subTitle: 'Take live image',
                              onTap: () {
                                Navigator.pop(context);
                                controller2.pickImageCamera();
                              },
                            ),
                            const SizedBox(height: tFormHeight - 10,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.photo_album_rounded,
                              title: 'Gallery',
                              subTitle: 'Select from Gallery',
                              onTap: () {
                                Navigator.pop(context);
                                controller2.pickImage();                          },
                            ),
                          ]
                        ),
                      )
                    ),
                  );
                  },
                                )
                          :  Image.network(
                              controller2.image.value.path, fit: BoxFit.cover,
                            ) 
                                
                            :
                                
                        controller2.image.value.path == ''
                          ? IconButton(
                  icon: const Icon(Icons.add_a_photo_outlined), 
                  onPressed: () {
                    showModalBottomSheet(
                    context: context, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tFormHeight - 10),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                            Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                            const SizedBox(height: tFormHeight,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.camera_enhance_rounded,
                              title: 'Camera',
                              subTitle: 'Take live image',
                              onTap: () {
                                Navigator.pop(context);
                                controller2.pickImageCamera();
                              },
                            ),
                            const SizedBox(height: tFormHeight - 10,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.photo_album_rounded,
                              title: 'Gallery',
                              subTitle: 'Select from Gallery',
                              onTap: () {
                                Navigator.pop(context);
                                controller2.pickImage();                          },
                            ),
                          ]
                        ),
                      )
                    ),
                  );
                  },
                                )
                          : Image.file(
                            File(controller2.image.value.path), fit: BoxFit.cover,
                          ),
                                
                              ),
                            ),
                ),

                Obx(
                  () => GestureDetector(
                    onTap: () {
                     
                    },            
                              child: Container(
                                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 180, 180, 180),
                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                width: double.infinity,
                                height: 95,
                                child:  kIsWeb ?
                        controller3.image.value.path == ''
                          ?  IconButton(
                  icon: const Icon(Icons.add_a_photo_outlined), 
                  onPressed: () {
                     showModalBottomSheet(
                    context: context, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tFormHeight - 10),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                            Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                            const SizedBox(height: tFormHeight,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.camera_enhance_rounded,
                              title: 'Camera',
                              subTitle: 'Take live image',
                              onTap: () {
                                Navigator.pop(context);
                                controller3.pickImageCamera();
                              },
                            ),
                            const SizedBox(height: tFormHeight - 10,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.photo_album_rounded,
                              title: 'Gallery',
                              subTitle: 'Select from Gallery',
                              onTap: () {
                                Navigator.pop(context);
                                controller3.pickImage();                          },
                            ),
                          ]
                        ),
                      )
                    ),
                  );
                  },
                                )
                          :  Image.network(
                              controller3.image.value.path, fit: BoxFit.cover,
                            ) 
                                
                            :
                                
                        controller3.image.value.path == ''
                          ?  IconButton(
                  icon: const Icon(Icons.add_a_photo_outlined), 
                  onPressed: () {
                     showModalBottomSheet(
                    context: context, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tFormHeight - 10),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                            Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                            const SizedBox(height: tFormHeight,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.camera_enhance_rounded,
                              title: 'Camera',
                              subTitle: 'Take live image',
                              onTap: () {
                                Navigator.pop(context);
                                controller3.pickImageCamera();
                              },
                            ),
                            const SizedBox(height: tFormHeight - 10,),
                            ForgotPasswordBtnWidget(
                              btnIcon: Icons.photo_album_rounded,
                              title: 'Gallery',
                              subTitle: 'Select from Gallery',
                              onTap: () {
                                Navigator.pop(context);
                                controller3.pickImage();                          },
                            ),
                          ]
                        ),
                      )
                    ),
                  );
                  },
                                )
                          : Image.file(
                            File(controller3.image.value.path), fit: BoxFit.cover,
                          ),
                               
                              ),
                            ),
                ),
      ],
    ),
          ),
        ],
      ),
    );
  }
}

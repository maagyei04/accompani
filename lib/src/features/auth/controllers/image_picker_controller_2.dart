import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController2 extends GetxController {

  Rx<File> image = File('').obs;

  Future pickImage() async {
    
    try {
      
      final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) {
          Get.snackbar(
            "Error",
            "Image is null!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          ); 
          const defaultImagePath = 'assets/logo/accompani.png';
          final defaultImage = File(defaultImagePath);
          image.value = defaultImage;

          return;
      } 

      final imageTmp = File(imagePick!.path);

      image.value = imageTmp; 

    } on PlatformException catch (e) {
          Get.snackbar(
            "Error",
            "Image is null $e!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );  
    }

  }

  Future pickImageCamera() async {
    
    try {
      
      final imagePick = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) {
          Get.snackbar(
            "Error",
            "Image is null!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          ); 
          const defaultImagePath = 'assets/logo/accompani.png';
          final defaultImage = File(defaultImagePath);
          image.value = defaultImage;

          return;
      } 

      final imageTmp = File(imagePick!.path);

      image.value = imageTmp; 
    } on PlatformException catch (e) {
          Get.snackbar(
            "Error",
            "Image is null, $e !",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );  
    }

  }

}
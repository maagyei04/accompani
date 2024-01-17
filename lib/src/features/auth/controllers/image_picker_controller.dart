
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController extends GetxController {
  Rx<File> image = File('').obs;

  Future<void> pickImage() async {
    try {
      final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (imagePick == null) {
        image.value = File('assets/logo/accompani.png');
        return;
      }

      final imageTmp = File(imagePick.path);
      image.value = imageTmp;
    } on PlatformException catch (e) {
      Get.snackbar(
        "Error",
        "Error picking image: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }

  Future<void> pickImageCamera() async {
    try {
      final imagePick = await ImagePicker().pickImage(source: ImageSource.camera);

      if (imagePick == null) {
        image.value = File('assets/logo/accompani.png');
        return;
      }

      final imageTmp = File(imagePick.path);
      image.value = imageTmp;
    } on PlatformException catch (e) {
      Get.snackbar(
        "Error",
        "Error picking image from camera: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }
}

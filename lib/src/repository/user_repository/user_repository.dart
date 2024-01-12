// ignore_for_file: avoid_print

import 'dart:math';
import 'package:accompani/src/features/auth/controllers/image_picker_controller.dart';
import 'package:accompani/src/features/auth/controllers/image_picker_controller_2.dart';
import 'package:accompani/src/features/auth/controllers/image_picker_controller_3.dart';
import 'package:accompani/src/features/auth/models/interest_model.dart';
import 'package:accompani/src/features/auth/models/personal_info_model.dart';
import 'package:accompani/src/features/auth/models/user_model2.dart';
import 'package:accompani/src/features/core/models/trip_model.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
    final controller = Get.put(AuthenticationRepository());
    final controller2 = Get.put(ImagePickerController());
    final controller3 = Get.put(ImagePickerController2());
    final controller4 = Get.put(ImagePickerController3());

  final _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<bool> doesEmailExist(String email) async {
    try {
      final querySnapshot = await _db
          .collection('Users') // Replace 'users' with your collection name
          .where('Emali', isEqualTo: email)
          .get();

      return querySnapshot.docs.isNotEmpty;

    } catch (e) {
      // Handle any errors in database query
      return false;
    }
  }


   Future<void> createUser(UserModel user) async {
    try {
      await _db.collection("Users").doc(controller.getUserID).set(user.toJson());
      Get.snackbar(
        'Success',
        'Your account has been successfully created.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      rethrow;
    }
  }


   Future<void> createTrip(TripModel trip) async {
    try {
      await _db.collection("Trips").doc(controller.getUserID).set(trip.toJson());
      Get.snackbar(
        'Success',
        'Your Trip has been successfully created.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      rethrow;
    }
  }

  Future<UserModel?> getUserDetails(String email) async {
    final snapshot = await _db.collection("Users")
      .where("Email", isEqualTo: email)
      .get();

    if (snapshot.docs.isNotEmpty) {
      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).first;
      return userData;
    } else {
      return null; // Return null when no data is found
    }
  }

  Future<UserModel> getUserInfoById(String userId) async {
    final snapshot = await _db.collection("Users")
    .where("UserId", isEqualTo: userId)
      .get();

      final userInfo = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userInfo;
  } 


  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel2 user) async {
        try {
       final result = await _db.collection("Users").doc(user.id).update(user.toJson());
      Get.snackbar(
        'Success',
        'Your account has been successfully created.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
      return result; // Return the DocumentReference
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      rethrow;
    }
  } 

    Future<void> updatePersonalRecord(PersonalInfoModel user) async {
        try {
       final result = await _db.collection("Users").doc(user.id).update(user.toJson());
      Get.snackbar(
        'Success',
        'Your Presonal Info has been added!!.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
      return result; // Return the DocumentReference
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      rethrow;
    }
  } 

 Future<void> updateUserInterest(InterestModel user) async {
        try {
       final result = await _db.collection("Users").doc(user.id).update(user.toJson());
      Get.snackbar(
        'Success',
        'Your Interests has been added!!.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
      return result; // Return the DocumentReference
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      rethrow;
    }
  } 

    Future<String> uploadPostImage() async {

    String fileName = '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(10000)}.png';


    try {
      Reference ref = _storage.ref().child('UserImages/$fileName');

      UploadTask uploadTask = ref.putFile(controller2.image.value);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl =  await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
       Get.snackbar(
        "Error",
        "Something went wrong. Image Upload Fail. Try Again, $e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      return 'Error';
    }
  }

  Future<String> uploadPostImage2() async {

    String fileName = '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(10000)}.png';


    try {
      Reference ref = _storage.ref().child('UserImages/$fileName');

      UploadTask uploadTask = ref.putFile(controller3.image.value);

      TaskSnapshot snapshot = await uploadTask;
       String downloadUrl =  await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Image Upload Fail. Try Again, $e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      return 'Error';
    }
  }

    Future<String> uploadPostImage3() async {

    String fileName = '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(10000)}.png';


    try {
      Reference ref = _storage.ref().child('UserImages/$fileName');

      UploadTask uploadTask = ref.putFile(controller4.image.value);

      TaskSnapshot snapshot = await uploadTask;
       String downloadUrl =  await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Image Upload Fail. Try Again, $e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      return 'Error';
    }
  }

}  
// ignore_for_file: avoid_print

import 'package:accompani/src/features/auth/models/user_model2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<bool> doesPhoneNumberExist(String phoneNumber) async {
    try {
      final querySnapshot = await _db
          .collection('Users') // Replace 'users' with your collection name
          .where('Phone', isEqualTo: phoneNumber)
          .get();

        print (querySnapshot.docs.isNotEmpty);
      return querySnapshot.docs.isNotEmpty;

    } catch (e) {
      // Handle any errors in database query
      print('Error checking phone number existence: $e');
      return false;
    }
  }


   Future<DocumentReference> createUser(UserModel user) async {
    try {
      final result = await _db.collection("Users").add(user.toJson());
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
      print("ERROR: $error");
      rethrow;
    }
  }


  Future<UserModel?> getUserDetails(String phoneNumber) async {
    final snapshot = await _db.collection("Users")
      .where("Phone", isEqualTo: phoneNumber)
      .get();

    if (snapshot.docs.isNotEmpty) {
      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).first;
      return userData;
    } else {
      return null; // Return null when no data is found
    }
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
      print("ERROR: $error");
      rethrow;
    }
  }

}  
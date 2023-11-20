// ignore_for_file: avoid_print

import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/auth/models/user_model2.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:accompani/src/features/auth/screens/welcome/welcome_screen.dart';
import 'package:accompani/src/features/auth/screens/welcome2/welcome_screen2.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers To Get Data From TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  final _authRepo = Get.put(AuthenticationRepository());

  final userRepo = Get.put(UserRepository());

  void phoneAuthentication(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }

  Future<void> createUser(UserModel user) async {
    var proceed = await userRepo.doesPhoneNumberExist(user.phoneNumber);

    if (proceed == false) {
      await userRepo.createUser(user);
      phoneAuthentication(user.phoneNumber);
      Get.to(() => const OTPScreen());
    } else {
      print ('User creation failed !!');
          Get.snackbar(
            "Error",
            "Account Already Exist!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.3),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );  
    }

  }

  Future<UserModel?> getUserData() {
  final phoneNumber = _authRepo.firebaseUser.value?.phoneNumber;
  print(_authRepo.firebaseUser.value?.phoneNumber);
  if (phoneNumber != null) {
    return userRepo.getUserDetails(phoneNumber);
  } else {
    Get.snackbar('Error', 'Login to continue', duration: const Duration(seconds: 6));
    return Future.value(null); // Return a Future that resolves to null
  }
}

  Future<void> updateUserInfo(UserModel2 user) async {
    await userRepo.updateUserRecord(user);
    Get.to(() => const WelcomeScreen2());
  }

  Future<List<UserModel>> getAllUsers() async => userRepo.allUsers();


}  
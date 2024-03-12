// ignore_for_file: avoid_print

import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/features/auth/controllers/signup_controller.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/auth/screens/email/email.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_otp/login_otp_screen.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  var otpController = Get.put(AuthenticationRepository());
  final userRepo = Get.put(UserRepository());

  final email  = TextEditingController();
  final password = TextEditingController();

  final isLoading = false.obs;
  final isGoogleLoading = false.obs;

  void loginUserWithPhoneNumber(String email, String phoneNumber) async {
    var proceed = await userRepo.doesEmailExist(email);
    if (proceed == true) {
      AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
      Get.to(() => const LoginOTPScreen());
    } else {
      Get.snackbar(
        'Error',
        'User Doesn\'t Exist',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }

  }

  void verifyOTPLogin(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const NavigationMenu()) : Get.back();
  }

  Future<dynamic> loginUser(String email, String password) async {
    try {

      final auth = AuthenticationRepository.instance;

      await auth.loginUserWithEmailAndPassword(email, password);

      Get.offAll(() => const NavigationMenu());

      return await auth.loginUserWithEmailAndPassword(email, password);
    } catch (e) {

       Get.snackbar(
        'Oh Snap!!',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );

      return;
    }
  }


  Future<void> googleSignUp() async {
    try {
      isGoogleLoading.value = true;
      
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      
      isGoogleLoading.value = false;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(auth.getUserID).get();

      if (!userDoc.exists) {

                          var user = UserModel(
                              email: auth.getUserEmail,
                              password: 'Default...',
                              firstName: 'Default',
                              lastName: 'Default...',
                              phoneNumber: 'Default',
                              bio: 'Default...',
                              interests: [
                                'Default...',
                                'Default...',
                              ], 
                              languages: [
                                'Default...',
                                'Default...',
                              ], 
                              photos: [
                                'Default...',
                                'Default...',
                              ],
                              priceTag: 'Default...',
                              location: 'Default...',
                              paymentMethods: [
                                'Default...',
                                'Deafult...',
                              ]
                            );

                        SignUpController.instance.registerUserGoogle(user);

                          Get.offAll(() => const EmailForm());

      } else {
                print("User Info already exists in Firestore. Skipping save.");
                          Get.offAll(() => const NavigationMenu());
     }
                        

    } catch (e) {
      isGoogleLoading.value = false;

       Get.snackbar(
        'Oh Snap!!',
       'Please check your Internet Connection...',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }}
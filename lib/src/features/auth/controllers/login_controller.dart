// ignore_for_file: avoid_print

import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/features/auth/controllers/signup_controller.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_otp/login_otp_screen.dart';
import 'package:accompani/src/features/auth/screens/welcome2/welcome_screen2.dart';
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

  void loginUser(String email, String password) async {
    try {
      isLoading.value = true;

      final auth = AuthenticationRepository.instance;
      await auth.loginUserWithEmailAndPassword(email, password);
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      isLoading.value = false;

       Get.snackbar(
        'Oh Snap!!',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
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
                              firstName: auth.getDisplayName,
                              lastName: 'Default...',
                              phoneNumber: auth.getUserPhone,
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

                        await Future.delayed(const Duration(seconds: 2), () async {
                          Get.offAll(() => const WelcomeScreen2());
                        });    

      } else {
        print("User Info already exists in Firestore. Skipping save.");
                        await Future.delayed(const Duration(seconds: 2), () async {
                          Get.offAll(() => const NavigationMenu());
                        });      }
                        

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
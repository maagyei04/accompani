import 'package:accompani/src/features/auth/screens/profile_process/me.dart';
import 'package:accompani/src/features/auth/screens/profile_process/personal_info/personal_info.dart';
import 'package:accompani/src/features/auth/screens/splashscreen/splash_screen.dart';
import 'package:accompani/src/features/auth/screens/welcome/welcome_screen.dart';
import 'package:accompani/src/features/core/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }


  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const HomeScreen());
  }

  String? getUserId() {
  User? user = _auth.currentUser;
  return user?.uid; // Returns the UID if the user is logged in, else returns null
  }

  Future<void> phoneAuthentication(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      }, 
      codeSent: ((verificationId, resendToken) {
        this.verificationId.value = verificationId;
      }), 
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: ((verificationId) {
        this.verificationId.value = verificationId;
      }),
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar(
            "Error",
            "The provided phone number is not valid.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.3),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );          
        } else {
          Get.snackbar(
            "Error",
            "Something went wrong. Try again.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.3),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );           
        }
      }, 

    );
  }

  Future<bool> verifyOTP (String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value, 
        smsCode: otp, 
    );
    try {
      var credentials = await _auth.signInWithCredential(credential);
      Get.snackbar(
        'Success',
        'Your have successfully logged in.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );      
      return credentials.user != null ? true : false;
    }  catch (e) {
          Get.snackbar(
            "Error",
            "Error during OTP verification: $e",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );       
      return false;   
    
    }
    
  }
  
  Future<void> logout() async => await _auth.signOut();
}
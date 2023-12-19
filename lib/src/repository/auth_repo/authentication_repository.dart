import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/features/auth/screens/login/login_screen.dart';
import 'package:accompani/src/features/auth/screens/mail_verification/mail_verification.dart';
import 'package:accompani/src/features/auth/screens/profile_process/me.dart';
import 'package:accompani/src/features/auth/screens/profile_process/personal_info/personal_info.dart';
import 'package:accompani/src/features/auth/screens/splashscreen/splash_screen.dart';
import 'package:accompani/src/features/auth/screens/welcome/welcome_screen.dart';
import 'package:accompani/src/repository/auth_repo/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  User? get user => firebaseUser.value;

  String get getUserID => user?.uid ?? '';

  String get getUserEmail => user?.email ?? '';

  String get getUserPhone => user?.phoneNumber ?? '';

 DateTime? get getUserDateJoined => user?.metadata.creationTime;  

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(firebaseUser.value);
  }

  setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const LoginScreen()) 
    : user.emailVerified 
      ? Get.offAll(() => const NavigationMenu()) 
      : Get.offAll(() => const MailVerificationScreen());
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

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try { 
     await _auth.createUserWithEmailAndPassword(email: email, password: password);
          Get.snackbar(
            "Success!!",
            "User successfuly created!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );  
     //firebaseUser.value != null ? Get.offAll(() => const SchoolSelectScreen()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch(e) {
      final ex = SignUpWithEmailAndpasswordFailure.code(e.code);
          Get.snackbar(
            "Oh Snap!!",
            ex.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );      
      throw ex;
    }  catch (_) {
      const ex = SignUpWithEmailAndpasswordFailure();
          Get.snackbar(
            "Oh Snap!!",
            ex.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );      
      throw ex;
    }
  }  

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndpasswordFailure.code(e.code);
      throw ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndpasswordFailure();
      throw ex.message;
    }
  }  
  
  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try { 
     await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      //login with email and password logic
    }  catch (_) {}
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Unable to logout. Try again';
    }
  }
} 
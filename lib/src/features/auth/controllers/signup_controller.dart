import 'package:accompani/src/features/auth/controllers/login_controller.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/auth/models/user_model2.dart';
import 'package:accompani/src/features/auth/screens/mail_verification/mail_verification.dart';
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

  final controller = Get.put(LoginController());

  void phoneAuthentication(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }

Future<dynamic>registerUser(UserModel user) async {
  try {

    final auth = AuthenticationRepository.instance;

    // Create user in Firebase Authentication
    await auth.createUserWithEmailAndPassword(user.email, user.password);

    // Delay the execution of createUser function by 2 seconds
    await Future.delayed(const Duration(seconds: 3), () async {
      await userRepo.createUser(user);
    });

    // Navigate to verification screen
    Get.offAll(() => const MailVerificationScreen());
    
    return await userRepo.createUser(user);
  } catch (e) {

    // Handle authentication or Firestore errors
    Get.snackbar(
      "Error",
      e.toString(),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent.withOpacity(0.3),
      colorText: Colors.red,
      duration: const Duration(seconds: 5),
    );

    return;
  }
} 


Future<void> registerUserGoogle(UserModel user) async {
  try {
     controller.isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2), () async {
      await userRepo.createUser(user);
    });

  } catch (e) {
     controller.isLoading.value = false;
    // Handle authentication or Firestore errors
    Get.snackbar(
      "Error",
      e.toString(),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent.withOpacity(0.3),
      colorText: Colors.red,
      duration: const Duration(seconds: 5),
    );
  }
} 
  Future<UserModel?> getUserData() {

  if (email != null) {
    final userEmail = _authRepo.getUserEmail;
    return userRepo.getUserDetails(userEmail);
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
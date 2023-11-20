import 'package:accompani/src/features/auth/screens/email/email.dart';
import 'package:accompani/src/features/core/screens/home/home.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();


  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    
    isVerified ? Get.offAll(const EmailForm()) : Get.back();
  }
}
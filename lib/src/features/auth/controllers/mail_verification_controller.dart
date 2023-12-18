
import 'dart:async';
import 'package:accompani/src/features/auth/screens/email/email.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;

  @override
    void onInit() {
      super.onInit();
      sendVerificationEmail();
      setTimerForAutoRedirect(); 
    }


    Future<void> sendVerificationEmail() async {
      try {
        await AuthenticationRepository.instance.sendEmailVerification();
      } catch (e) {
        Get.snackbar('Oh Snap!!', e.toString());
      }
    }

    void setTimerForAutoRedirect() {
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        FirebaseAuth.instance.currentUser?.reload();  
        final user = FirebaseAuth.instance.currentUser;
        if (user!.emailVerified) {
          timer.cancel();
              await Future.delayed(const Duration(seconds: 5), () async {
                          Get.offAll(() => const EmailForm());
              });
        } 
       });
    } 

    Future<void> manuallyCheckEmailVerificationStatus() async {
      FirebaseAuth.instance.currentUser?.reload(); 
        final user = FirebaseAuth.instance.currentUser;
        if (user!.emailVerified) {
              await Future.delayed(const Duration(seconds: 5), () async {
                          Get.offAll(() => const EmailForm());
              });
        } 
    }
    
    
}
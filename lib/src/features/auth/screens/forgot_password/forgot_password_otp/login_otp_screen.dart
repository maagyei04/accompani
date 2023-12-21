import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class LoginOTPScreen extends StatelessWidget {
  const LoginOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(LoginController());
    var otp;

    return Scaffold(  
      body: Container( 
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: tFormHeight - 10,),

            const Text(tOtpMessage2, textAlign: TextAlign.center,),

            const SizedBox(height: tFormHeight - 10,),

            OtpTextField(
              fieldWidth: 43,
              showFieldAsBox: true,
              numberOfFields: 6,
              filled: false,
              borderWidth: 1,
              cursorColor: Colors.green,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              keyboardType: TextInputType.number,
              enabledBorderColor: tDarkColor,
              borderColor: tDarkColor,
              focusedBorderColor: tPrimaryColor,
              onSubmit: (code) {
                otp = code;
                LoginController.instance.verifyOTPLogin(otp);
              },
            ),

          ],
        ),
      ),
    );
  }
}
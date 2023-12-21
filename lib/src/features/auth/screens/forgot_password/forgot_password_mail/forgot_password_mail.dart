import 'package:accompani/src/common_widgets/form/form_header_widget.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_otp/login_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              const SizedBox(height: tDefaultSize * 4,),
              const FormHeaderWidget(
                image: tAppLogoImage, 
                title: tForgotPassword, 
                subTitle: tForgotMailSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: tFormHeight,
                textAlign: TextAlign.center,
              ),
      
              const SizedBox(height: tFormHeight,),
      
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmailHint,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),

                    const SizedBox(height:  tFormHeight - 10,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const LoginOTPScreen());
                        },
                        child: const Text(tNext),
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_mail/forgot_password_mail.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_options/forgot_password_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
 
 class ForgotPasswordScreen {
 static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                  context: context, 
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(tFormHeight -10),
                      topRight: Radius.circular(tFormHeight -10),
                    ),
                  ),
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                          Text(tForgotPasswordSubTitle, style: Theme.of(context).textTheme.displayMedium,),
                          const SizedBox(height: tFormHeight,),
                          ForgotPasswordBtnWidget(
                            btnIcon: Icons.mail_outline_outlined,
                            title: tEmail,
                            subTitle: tResetViaEmail,
                            onTap: () {
                              Navigator.pop(context);
                              Get.to(() => const ForgotPasswordMailScreen());
                            },
                          ),
                          const SizedBox(height: tFormHeight - 10,),

                        ]
                      ),
                    )
                  ),
                );
  }
}
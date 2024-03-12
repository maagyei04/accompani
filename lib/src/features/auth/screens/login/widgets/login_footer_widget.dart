import 'package:accompani/src/common_widgets/loading/loading_widget.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/login_controller.dart';
import 'package:accompani/src/features/auth/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          const Text("or"),

          const SizedBox(height: tFormHeight -20,),

          SizedBox(
            width: double.infinity,
            child: Obx(
              () => OutlinedButton.icon(
                icon: controller.isGoogleLoading.value ? const SizedBox() : const Image(image: AssetImage(tGoogleLogoImage), width: 20.0,),
                onPressed: controller.isGoogleLoading.value || controller.isLoading.value 
                ? () {} 
                : controller.isGoogleLoading.value
                  ? () {}
                  :() => controller.googleSignUp(),
                label: controller.isGoogleLoading.value 
                ? const ButtonLoadingWidget()
                : Text(tSignInWithGoogle, style: Theme.of(context).textTheme.displayMedium,),
                
              ),
            ),
          ),

    const SizedBox(height: tFormHeight -20,),

      TextButton(
        onPressed: (){
          Get.to(() => const SignUpScreen());
        },
        child: Text.rich(
          TextSpan(
            text: tNewAccount,
            style: Theme.of(context).textTheme.bodySmall,
            children: const [
              TextSpan(
                text: tSignup,
                style: TextStyle(
                  color: Colors.blue,
                )
              ),
            ]
          ) 
        ),
      ),
      ],
    );
  }
}
import 'package:accompani/src/common_widgets/loading/loading_widget.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/login_controller.dart';
import 'package:accompani/src/features/auth/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupFooterWidget extends StatelessWidget {
  const SignupFooterWidget({
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
          Get.to(() => const LoginScreen());
        },
        child: Text.rich(
          TextSpan(
            text: tAlreadyHaveAnAccount,
            style: Theme.of(context).textTheme.bodySmall,
            children: const [
              TextSpan(
                text: tLogin,
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
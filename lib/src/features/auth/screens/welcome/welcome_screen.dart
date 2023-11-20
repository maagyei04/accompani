import 'package:accompani/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:accompani/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:accompani/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startWelcomeAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;


    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tWelcomeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4), // Adjust the opacity as needed
          ),
          TFadeInAnimation(
            durationInMs: 1200,
            animatePosition: TAnimatePosition(
              bottomAfter: 0,
              bottomBefore: -100,
              leftBefore: 0,
              leftAfter: 0,
              topBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  Hero(
                    tag: 'Welcome-image-tag',
                    child: Image(
                      image: const AssetImage(tAppLogoImage),
                      height: height * 0.6,
                    ),
                  ),

                  Text(
                    tWelcomeScreenTitle,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(tGetStarted, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

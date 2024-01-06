import 'package:accompani/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:accompani/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:accompani/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/video_controller.dart';
import 'package:accompani/src/features/auth/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startWelcomeAnimation();

    final VideoController videoController = Get.put(VideoController());

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: width,
              height: height,
              child: AnimatedOpacity(
                opacity: 1.0, 
                duration: const Duration(milliseconds: 1000),
                child:VideoPlayer(videoController.videoPlayerController),
          ),
            ),
          ),
          

          Container(
            color: Colors.black.withAlpha(50),
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
                  Text(
                    tWelcomeScreenTitle,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        videoController.videoPlayerController.dispose();
                        Get.offAll(() => const SignUpScreen());
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

import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCompleteScreen extends StatelessWidget {
  const ProfileCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(tCheckLogo), color: tPrimaryColor,),

            SizedBox(height: 15.0,),

            SizedBox(
              width: 260,
              child: Text('Youv\'e completed your Profile Setup Process', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)),
          ],
        ),
      ),


      bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(tDefaultSize - 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Get.offAll(() => const NavigationMenu());
                          },
                          child: const Text(tGetStarted)
                        ),
                      )
                    ],
                  ),
                ),
              ) ,
    );
  }
}
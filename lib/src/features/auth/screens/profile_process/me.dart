import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/auth/controllers/proccess_controller.dart';
import 'package:accompani/src/features/auth/screens/profile_process/completed/profile_completed.dart';
import 'package:accompani/src/features/auth/screens/profile_process/personal_info/personal_info.dart';
import 'package:accompani/src/features/auth/screens/profile_process/select_interests/select_interest.dart';
import 'package:accompani/src/features/auth/screens/profile_process/social_link/social_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:get/get.dart';


class StepIndicatorScreen extends StatelessWidget {
  final ProcessController stepController = Get.put(ProcessController());

  StepIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {

  String getTextForStep(int currentPageValue) {
  String text = '';
  switch (currentPageValue) {
    case 0:
      text = 'Profile Information';
      break;
    case 1:
      text = 'Select Your Interests';
      break;
    case 2:
      text = 'Social Media Accounts';
      break;
    case 3:
      text = 'Completed';
      break;
    default:
      text = ''; // Handle other cases if needed
  }
  return text;
}

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() {
          String appBarTitle = getTextForStep(stepController.currentPage.value);
          return Text(appBarTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),);
        })
      ),
      body: Column(
        children: [
                    Obx(() => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FlutterStepIndicator(
                        list: stepController.steps,
                        onChange: (int index) {
                          //
                        },
                        page: stepController.currentPage.value,
                        positiveColor: tPrimaryColor,
                        negativeColor: Colors.grey.withOpacity(0.1),
                        progressColor: tPrimaryColor,
                        division: 4, 
                         height: 25,
                      ),
                    )),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: stepController.pageController,
              onPageChanged: stepController.onPageChangeCallback,
              children: const [
                PersonalInfoScreen(),
                SelectionScreen(),
                AddSocialMedia(),
                ProfileCompleteScreen()               
              ],
            ),
          ),

        ],
      ),
    );
  }
  
}






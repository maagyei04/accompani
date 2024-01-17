import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/core/screens/Experience/experience_screen.dart';
import 'package:accompani/src/features/core/screens/Explore/explore_screen.dart';
import 'package:accompani/src/features/core/screens/Inbox/chat.dart';
import 'package:accompani/src/features/core/screens/Profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    final tBackgroundColor = isDarkMode ? tSecondaryColor : tWhiteColor;
    final tIconColor = isDarkMode ? tWhiteColor : const Color.fromARGB(255, 123, 123, 123);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: tBackgroundColor,
          indicatorColor: tPrimaryColor.withOpacity(0.1),
          height: 80.0,
          elevation: 1,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: 
          [        
            NavigationDestination(icon: Icon(Icons.search_outlined, color:tIconColor, size: 25.0,), label: 'Explore',),
            NavigationDestination(icon: Icon(Icons.refresh_outlined, color: tIconColor, size: 25.0), label: 'Experience'),
            NavigationDestination(icon: Icon(Icons.message_outlined, color: tIconColor, size: 25.0), label: 'Inbox'),
            NavigationDestination(icon: Icon(Icons.person_3_outlined, color: tIconColor, size: 25.0), label: 'Profile'),
          ]
      
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    ); 
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const ExploreScreen(),
    const ExperienceScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
}
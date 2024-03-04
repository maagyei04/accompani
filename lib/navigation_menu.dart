import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/features/core/screens/Booking_Process/get_started.dart';
import 'package:accompani/src/features/core/screens/Explore/explore_screen.dart';
import 'package:accompani/src/features/core/screens/Inbox/chat.dart';
import 'package:accompani/src/features/core/screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: tWhiteColor,
          indicatorColor: tPrimaryColor.withOpacity(0.1),
          height: 65.0,
          elevation: 1,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: 
          const [        
            NavigationDestination(icon: Icon(Icons.search_outlined, color:tDarkColor, size: 23.0,), label: 'Explore',),
            NavigationDestination(icon: Icon(Icons.refresh_outlined, color: tDarkColor, size: 23.0), label: 'Experience'),
            NavigationDestination(icon: Icon(Icons.message_outlined, color: tDarkColor, size: 23.0), label: 'Inbox'),
            NavigationDestination(icon: Icon(Icons.person_3_outlined, color: tDarkColor, size: 23.0), label: 'Profile',),
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
    const GetTripStarted(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
}
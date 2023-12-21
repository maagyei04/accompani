
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcessController extends GetxController {
  final PageController pageController = PageController();
  final List<String> steps = ['Step 1', 'Step 2', 'Step 3', 'Step 4'];
  RxInt currentPage = 0.obs;

  
  onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;

    void nextPage() {
    if (currentPage.value < steps.length - 1) {
      currentPage.value++; // Update the current page value
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Rx<dynamic> data = Rx<dynamic>(null);
}

class ProcessController extends GetxController {
  final PageController pageController = PageController();
  final List<String> steps = ['Step 1', 'Step 2', 'Step 3', 'Step 4'];
  RxInt currentPage = 0.obs;

  DataController dataController = Get.put(DataController());
  
  onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;

  void nextPageWithData(dynamic data) {
    if (currentPage.value < steps.length - 1) {
      dataController.data.value = data;
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void nextPage() {
    if (currentPage.value < steps.length - 1) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }  

}
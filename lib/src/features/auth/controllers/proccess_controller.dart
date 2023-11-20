
import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:get/get.dart';

class ProcessController extends GetxController {
  final PageController pageController = PageController();
  final List<String> steps = ['Step 1', 'Step 2', 'Step 3', 'Step 4'];
  RxInt currentPage = 0.obs;

  
  onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final bio = TextEditingController();
  RxList<String> languageList = <String>[].obs;

  void addToTopOfList(String text) {
    languageList.insert(0, text);
    textEditingController.clear();
  }

  void removeFromLanguageList(String text) {
    languageList.remove(text);
  }
  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
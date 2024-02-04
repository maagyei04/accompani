import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final guest = TextEditingController();
  RxList<String> guestList = <String>[].obs;
  Rx<int?> selectedContainerIndex = Rx<int?>(null);

  void selectContainer(int index) {
    selectedContainerIndex(index);
  }

  void addToTopOfGuestList(String text) {
    guestList.insert(0, text);
    textEditingController.clear();
  }

  void removeFromGuestList(String text) {
    guestList.remove(text);
  }
  
  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
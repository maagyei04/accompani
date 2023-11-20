
import 'package:accompani/src/features/core/screens/home/home.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offAll(() => const HomeScreen());
  }

  Future startWelcomeAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }

} 
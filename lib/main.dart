import 'dart:async';

import 'package:accompani/firebase_options.dart';
import 'package:accompani/src/features/auth/controllers/video_controller.dart';
import 'package:accompani/src/features/auth/screens/splashscreen/splash_screen.dart';
import 'package:accompani/src/features/auth/screens/welcome/welcome_screen.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:accompani/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  

  await Firebase.initializeApp(options:
    DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  runApp(const MainApp());

}

class MainApp extends StatelessWidget { 
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
       theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(
        child: WelcomeScreen(),
      ),
      );
  }
}
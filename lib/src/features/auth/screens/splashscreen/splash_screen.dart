import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _mounted = false;

  @override
  void initState() {
    super.initState();
    _mounted = true;

    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (_mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => widget.child!),
            (route) => false,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/accompani.png'),
          ],
        ),
      ),
    );
  }
}

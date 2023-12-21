import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/auth/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:  Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: const SignupForm(),
            ),
        ),
      ),
      );
  }
}
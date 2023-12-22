import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/features/auth/screens/signup/widgets/signup_footer_widget.dart';
import 'package:accompani/src/features/auth/screens/signup/widgets/signup_form_widget.dart';
import 'package:accompani/src/features/auth/screens/signup/widgets/signup_header_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0,),
              SignupHeaderWidget(size: size),
              const SignupForm(),
              const SignupFooterWidget()
            ],
          ),
          
        ),
      ),
    );
  }
}
// ignore_for_file: avoid_print

import 'package:accompani/src/common_widgets/loading/loading_widget2.dart';
import 'package:accompani/src/common_widgets/rive/rive.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/login_controller.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_options/forgot_password_modal_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  }); 

  @override
  State<LoginForm> createState() => _LoginFormState();
  
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = true;
  final controller = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);

    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmailHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
        
                const SizedBox(height: tFormHeight - 20,),
                
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
                obscureText: !_isPasswordVisible,
                controller: controller.password,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  suffixIcon: IconButton(
                        icon: _isPasswordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });         
                })
                ),
                
              ),
      
              const SizedBox(height: tFormHeight - 20,),
      
      
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ForgotPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(tForgotPassword, style: TextStyle(fontSize: 12.0),),
                ),
              ),
              const SizedBox(height: 10.0,),
              
              SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      /* --
                      if(formKey.currentState!.validate()) {
                        LoginController.instance.loginUser(
                          controller.email.text.trim(), 
                          controller.password.text.trim(),
                        );
                      },
                      -- */
                      if(formKey.currentState!.validate()) {
      
                        if (controller.email.text.isNotEmpty && controller.password.text.isNotEmpty) {
                        overlay.during(
                            LoginController.instance.loginUser(
                              controller.email.text.trim(),
                              controller.password.text.trim(),
                            ),        
                        );
      
      
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please fill all the fields",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.redAccent.withOpacity(0.3),
                            colorText: Colors.red,
                            duration: const Duration(seconds: 7),
                          );
                        }
      
                  
                      }                       
                    }, 
                    child: const Text(tLogin, style: TextStyle(fontWeight: FontWeight.bold),)
                  
                  ),
                ),
              ) 
            ],
          ),
        )
      ),
    );
  }
  
  }

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.white,
      shadowColor:  Color.fromARGB(255, 244, 244, 244),
      content: Column(
        children: [
          RiveWidget(asset: 'assets/rive/loading.riv', width: 100, height: 100),
          SizedBox(height: 10.0,),
          Text('Please Wait...'),
        ]
      ),
    );
    
  }
}
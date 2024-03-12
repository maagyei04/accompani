import 'package:accompani/src/common_widgets/rive/rive.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/signup_controller.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
  // ignore_for_file: avoid_print

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  }); 

  @override
  State<SignupForm> createState() => _SignupFormState();
  
}

class _SignupFormState extends State<SignupForm> {
  bool _isPasswordVisible = true;
  final controller = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: GestureDetector(
        onTap: () {
           FocusManager.instance.primaryFocus?.unfocus();
        },
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
            
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(formKey.currentState!.validate()) {
            
                          if (controller.email.text.isNotEmpty &&
                              controller.password.text.isNotEmpty
                            ) {
            
                            final user = UserModel(
                                email: controller.email.text.trim(),
                                password: controller.password.text.trim(),
                                firstName: 'Default...',
                                lastName: 'Default...',
                                phoneNumber: 'Default..',
                                bio: 'Default...',
                                interests: [
                                  'Default...',
                                  'Default...',
                                ], 
                                languages: [
                                  'Default...',
                                  'Default...',
                                ], 
                                photos: [
                                  'Default...',
                                  'Default...',
                                ],
                                priceTag: 'Default...',
                                location: 'Default...',
                                paymentMethods: [
                                  'Default...',
                                  'Deafult...',
                                ]
                              );
            
                          var success = await SignUpController.instance.registerUser(user);

                          Get.showOverlay(
                            asyncFunction: success,
                            loadingWidget: const AlertDialog(
                              backgroundColor: Colors.white,
                              shadowColor:  Color.fromARGB(255, 244, 244, 244),
                              content: Column(
                                children: [
                                  RiveWidget(asset: 'assets/rive/loading.riv', width: 100, height: 100),
                                  SizedBox(height: 10.0,),
                                  Text('Please Wait...'),
                                ]
                              ),
                            ),

                          );
                          
                        } else {
                            // Handle case where not all fields are filled
                          Get.snackbar(
                            "Error",
                            "Please fill all the fields",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.redAccent.withOpacity(0.3),
                            colorText: Colors.red,
                            duration: const Duration(seconds: 7),
                          );
                        }
                      }},
                      child: const Text(tContinue, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
            ],
          ),
        ),
      )
    );
  }
  
  }
// ignore_for_file: avoid_print

import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/login_controller.dart';
import 'package:accompani/src/features/auth/controllers/signup_controller.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/auth/models/user_model2.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_options/forgot_password_modal_buttom_sheet.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({
    super.key,
  }); 

  @override
  State<EmailForm> createState() => _EmailFormState();
  
}

class _EmailFormState extends State<EmailForm> {

  final controller = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provide Info Below To Continue', style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: Container(
        padding: const EdgeInsets.all(tFormHeight - 10),

        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                print('Data available: ${snapshot.data}');
                UserModel userData = snapshot.data as UserModel;
                return 
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: tFormHeight ,),
              
              
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                    labelText: tEmail,
                    hintText: tEmailHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
          
                const SizedBox(height: tFormHeight,),
                
                TextFormField(
                  controller: controller.firstName,
                  decoration: const InputDecoration(
                    labelText: tFirstName,
                    hintText: tFirstName,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
          
                const SizedBox(height: tFormHeight,),
          
          
                TextFormField(
                  controller: controller.lastName,
                  decoration: const InputDecoration(
                    labelText: tLastName,
                    hintText: tLastName,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
          
                const SizedBox(height: tFormHeight + 230,),
                
          
                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
          
                        
                      final user = UserModel2(
                          id: userData.id,
                          email: controller.email.text.trim(),
                          firstName: controller.firstName.text.trim(),
                          lastName: controller.lastName.text.trim(),
                        );
          
                        SignUpController.instance.updateUserInfo(user);
          
                      }                       
                    }, 
                    child: const Text(tContinue, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            )
          );
                
                
                          
              } else if (snapshot.hasError) {
                                  // ignore: avoid_print
                                  print(snapshot.error.toString());
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No data available'),
      );
    }else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }            
          },
         
        ),
      ),
    );
  }
  
  }
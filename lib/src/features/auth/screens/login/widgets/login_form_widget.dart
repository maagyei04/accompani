// ignore_for_file: avoid_print

import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/login_controller.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_options/forgot_password_modal_buttom_sheet.dart';
import 'package:accompani/src/features/auth/screens/forgot_password/forgot_password_otp/login_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  }); 

  @override
  State<LoginForm> createState() => _LoginFormState();
  
}

class _LoginFormState extends State<LoginForm> {

  final controller = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* --
            TextFormField(
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
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),

            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_android_outlined),
                labelText: tPhoneNumber,
                hintText: tPhoneNumberHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),

            const SizedBox(height: tFormHeight - 20,),
-- */
            InternationalPhoneNumberInput(
                height: 50,
                inputFormatters: const [],
                formatter: MaskedInputFormatter('000 000 0000'),
                initCountry: CountryCodeModel(
                    name: "United States", dial_code: "+1", code: "US"),
                betweenPadding: 8,
                onInputChanged: (number) {
                final fullNumber = '${number.dial_code} ${number.number}';
                controller.phoneNumber.text = fullNumber;
                print(fullNumber);
                },
                dialogConfig: DialogConfig(
                  backgroundColor: tWhiteColor,
                  searchBoxBackgroundColor: const Color.fromARGB(255, 199, 200, 199),
                  searchBoxIconColor: tDarkColor,
                  countryItemHeight: 55,
                  topBarColor: tDarkColor,
                  selectedItemColor: const Color.fromARGB(255, 199, 200, 199),
                  selectedIcon: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.phone_android_rounded,
                    )
                  ),
                  textStyle: const TextStyle(
                      color: tDarkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  searchBoxTextStyle: const TextStyle(
                      color: tDarkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  titleStyle: const TextStyle(
                      color: tDarkColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  searchBoxHintStyle: const TextStyle(
                      color: tDarkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                countryConfig: CountryConfig(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: const Color.fromARGB(255, 103, 101, 101),),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    noFlag: false,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                phoneConfig: PhoneConfig(
                  focusedColor: tPrimaryColor,
                  enabledColor:  const Color.fromARGB(255, 103, 101, 101),
                  radius: 8,
                  hintText: tPhoneNumber,
                  borderWidth: 1,
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
            ),
                             
                             /* --

            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
                    // Get the raw phone number from number.phoneNumber
                final rawPhoneNumber = number.phoneNumber;

                // Update your controller with the raw phone number
                controller.phoneNumber.text = rawPhoneNumber!;
                print(rawPhoneNumber);
              },
              onInputValidated: (bool value) {
                print(value); 
              },
              selectorConfig: const SelectorConfig(
                trailingSpace: false,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: isDarkMode ? tWhiteColor : tDarkColor),
              initialValue: number,
              formatInput: true,
              keyboardType:
                  const TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
          -- */

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
              child: ElevatedButton(
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
                    LoginController.instance.loginUserWithPhoneNumber(
                      controller.phoneNumber.text.trim(),
                    );

                  }                       
                }, 
                child: const Text(tLogin, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      )
    );
  }
  
  }
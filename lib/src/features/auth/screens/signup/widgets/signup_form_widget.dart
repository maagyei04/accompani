import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/signup_controller.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/auth/screens/signup/widgets/signup_footer_widget.dart';
import 'package:accompani/src/features/auth/screens/signup/widgets/signup_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  }); 

  @override
  State<SignupForm> createState() => _SignupFormState();
  
}

class _SignupFormState extends State<SignupForm> {

  final controller = Get.put(SignUpController());
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    final formKey = GlobalKey<FormState>();

    return Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                         SizedBox(height: size.height * 0.1,),

                        SignupHeaderWidget(size: size),
                        const SizedBox(height: 10.0,),
  
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
              
            Builder(
              builder: (context) {
                return TextFormField(
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
                  
                );
              }
            ),
      /* --
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
      /* --
              InternationalPhoneNumberInput(
                  height: 50,
                  inputFormatters: const [],
                  formatter: MaskedInputFormatter('000 000 0000'),
                  initCountry: CountryCodeModel(
                      name: "United States", dial_code: "+1", code: "US"),
                  betweenPadding: 8,
                  onInputChanged: (number) {
                  var fullNumber = '${number.dial_code} ${number.number}';
                  fullNumber = fullNumber.replaceAll(' ', '');
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
                            -- */   
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

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        /* ---- sign in via email method
                        SignUpController.instance.registerUser(
                          controller.email.text.trim(), 
                          controller.password.text.trim(),
                        );
                        ---- */

                        /* --
                        SignUpController.instance.phoneAuthentication(
                          controller.phoneNumber.text.trim()
                        );
                        Get.to(() => const OTPScreen());
                        -- */
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
                            );

                        SignUpController.instance.registerUser(user);
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
                            const SizedBox(height: tFormHeight - 20,),
      
              const SignupFooterWidget(),
            ],
          ),
        )
      );
  }
  
  }
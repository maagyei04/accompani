import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/signup_controller.dart';
import 'package:accompani/src/features/auth/models/user_model2.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
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
  final controller2 = Get.put(AuthenticationRepository());


  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provide Info Below To Continue', style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: Container(
        padding: const EdgeInsets.all(tFormHeight - 10),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: tFormHeight ,),
              
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

                              const SizedBox(height: tFormHeight,),

            TextFormField(
              style: const TextStyle(fontSize: 15.0),
              controller: controller.firstName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tFirstName,
                hintText: tFirstName,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          
                const SizedBox(height: tFormHeight,),
                
            TextFormField(
              style: const TextStyle(fontSize: 15.0),
              controller: controller.lastName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
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
                          id: controller2.getUserID,
                          phoneNumber: controller.phoneNumber.text.trim(),
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
          ),
          ),
);
}
}
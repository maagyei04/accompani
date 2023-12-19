import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Survey', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 270.0,
              child: Text('Are you a Local Resident or Your\'e planning a Trip?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),)
            ),
            const SizedBox(height: 20.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RadioListTile<int>(
                  title: const Text('local', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: tDarkColor),),
                  value: 1,
                  activeColor: tPrimaryColor,
                  groupValue: _selectedValue,
                  splashRadius: 30.0,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('Planning a Trip', style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: tDarkColor),),
                  value: 2,
                  activeColor: tPrimaryColor,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: (){}, 
                          child: const Text('Cancel')
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Get.to(() => const NavigationMenu());
                          },
                          child: const Text(tNext)
                        ),
                      )
                    ],
                  ),
                ),
              ) ,
    );
  }
}
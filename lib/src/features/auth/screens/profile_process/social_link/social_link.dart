import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/controllers/proccess_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSocialMedia extends StatelessWidget {
  const AddSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final ProcessController stepController = Get.find();
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 160.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey
            )
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  Image(image: AssetImage(tInstagramLogo), height: 25,),
                  Text('Connect Your Instagram Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                ],
              ),
              const Text('You can add up 4 Instagram accounts', style: TextStyle(fontSize: 15.0)),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),                    
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add_circle)
                    ),
                  ),
                                    Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),                    
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add_circle)
                    ),
                  ),
                                    Container(
                    padding: const EdgeInsets.all(15.0),                  
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),                    
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add_circle)
                    ),
                  ),
                                    Container(
                    padding: const EdgeInsets.all(15.0),                  
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),                    
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add_circle)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: (){
                            stepController.nextPage();
                          }, 
                          child: const Text(tSkip)
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){},
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
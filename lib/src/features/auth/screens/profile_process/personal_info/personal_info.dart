import 'package:accompani/src/constants/sizes.dart';
import 'package:accompani/src/constants/text_strings.dart';
import 'package:accompani/src/features/auth/screens/profile_process/personal_info/widgets/multiple_image_upload.dart';
import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
        
              const Text('Upload Your Photos',style: TextStyle(fontWeight: FontWeight.bold),),
        
              const SizedBox(height: 5,),
        
              const MultipleImageUpload(),
        
              const SizedBox(height: 5,),

              const Text('Languages You Speak',style: TextStyle(fontWeight: FontWeight.bold),),
              const Text('Select the languages you speak',style: TextStyle(fontSize: 12),),

              const SizedBox(height: 10,),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Select Language',
                    hintText: 'Input the languages you speak with \',\' seperating them',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),

              const SizedBox(height: 10,),
              const Text('Your Bio',style: TextStyle(fontWeight: FontWeight.bold),),
        
              const SizedBox(height: 10,),

                TextFormField(
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: 'About You',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),  
     
            ]
          ),
        ),
      ),
      bottomNavigationBar: 
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: (){}, 
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
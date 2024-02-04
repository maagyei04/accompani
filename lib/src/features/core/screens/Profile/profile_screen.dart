// ignore_for_file: avoid_print

import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/common_widgets/custom_dialogue/custom_dialogue.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:accompani/src/features/core/screens/Experience/experience_screen.dart';
import 'package:accompani/src/features/core/screens/Profile/widgets/button_tile.dart';
import 'package:accompani/src/features/core/screens/Profile/widgets/profile_card.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;

    final controller = Get.put(UserRepository());

    final String myUid = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<UserModel>(
      future: controller.getUserInfoById(myUid),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Replace with a suitable widget for the loading state
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ); // Replace with a suitable error widget
        }

        final user = snapshot.data!;
      
      return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_outlined))),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ProfileCard(
                widthSize: widthSize,
                picture: NetworkImage(user.photos[0]),
                name: user.firstName == 'Default...' ? AuthenticationRepository.instance.getDisplayName : user.firstName,
                userType: user.userType!,
              ),

              const SizedBox(height: 10.0,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: widthSize,
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Become A Compani', style: Theme.of(context).textTheme.displayLarge,),
                        const SizedBox(width: 210.0,
                          child: Text('Set up your Compani Profile and start earning', maxLines: 2, style: TextStyle(fontSize: 15.0),))
                      ],                          
                    ),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_circle_right_rounded, color: tPrimaryColor, size: 45,)),
                  ],
                ),
              ),     

              const SizedBox(height: 30.0,),

                  Text('My Account', style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 5.0,),

                  const ButtonTile(title: 'Personal Details'), 

                                const SizedBox(height: 10.0,),

                  InkWell(onTap: () => Get.to(() => const ExperienceScreen()), child: const ButtonTile(title: 'Trips',)),


                                const SizedBox(height: 10.0,),

                  const ButtonTile(title: 'Payment'), 

                                const SizedBox(height: 10.0,),

                  const ButtonTile(title: 'Get Verified'), 
 

                                const SizedBox(height: 10.0,),

                  Text('Hosting', style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 5.0,),

                  const ButtonTile(title: 'Swith To Host'), 
 

                                const SizedBox(height: 10.0,),

                  const ButtonTile(title: 'Accompani Profile'), 
 

                                const SizedBox(height: 10.0,),

                  Text('App Support', style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 5.0,),

                  const ButtonTile(title: 'Help & Support'), 
 

                                const SizedBox(height: 10.0,),

                  const ButtonTile(title: 'Submit Feedback'), 


                                const SizedBox(height: 10.0,),

                  const ButtonTile(title: 'App Guide'), 
                                const SizedBox(height: 30.0,),

                GestureDetector(
                      onTap: () {
                         _showCustomDialog(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:Border.all(
                            color: Colors.red,
                            width: 1.0,
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Logout', style: Theme.of(context).textTheme.displayMedium,),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
              ],
          ),
        ),
      ),
    );
      
  });
    
    
  
  }
}

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Logout',
          content: 'Are you sure you want to Logout?',
          onConfirm: () {
            AuthenticationRepository.instance.logout();
          },
        );
      },
    );
  }
// ignore_for_file: avoid_print

import 'package:accompani/src/common_widgets/custom_dialogue/custom_dialogue.dart';
import 'package:accompani/src/common_widgets/custom_icon/custom_icon.dart';
import 'package:accompani/src/common_widgets/rive/rive.dart';
import 'package:accompani/src/constants/colors.dart';
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
          return const Center(
            child: RiveWidget(
              asset: 'assets/rive/loading.rive',
              width: 200,
              height: 200,
            ),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: RiveWidget(
              asset: 'assets/rive/no_internet_connection.riv',
              width: 300,
              height: 300,         
            )
          );
        }

        final user = snapshot.data!;
      
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
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
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 1),
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
                        Text('Become An Accompani', style: Theme.of(context).textTheme.displayLarge,),
                        const SizedBox(width: 210.0,
                          child: Text('Set up your Accompani Profile and start earning', maxLines: 2, style: TextStyle(fontSize: 15.0),))
                      ],                          
                    ),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_circle_right_rounded, color: tPrimaryColor, size: 45,)),
                  ],
                ),
              ),     
        
              const SizedBox(height: 30.0,),
        
              const SizedBox(height: 5.0,),
        
                  const ButtonTile(title: 'Personal Details', icon: CustomIcon(color: Colors.blue, icon: Icon(Icons.person, color: Colors.white,),)), 
        
                                const SizedBox(height: 10.0,),
        
                  const ButtonTile(title: 'Trips', screen: ExperienceScreen(), icon: CustomIcon(color: Colors.purple, icon: Icon(Icons.flight, color: Colors.white,),)),
        
        
                                const SizedBox(height: 10.0,),
        
                  const ButtonTile(title: 'Payment', icon: CustomIcon(color: Color.fromARGB(255, 15, 0, 103), icon: Icon(Icons.money, color: Colors.white,),)),
        
                                const SizedBox(height: 10.0,),
        
                  const ButtonTile(title: 'Get Verified', icon: CustomIcon(color: Color.fromARGB(255, 166, 149, 0), icon: Icon(Icons.verified, color: Colors.white,),)),
         
        
                                const SizedBox(height: 40.0,),
        
        
                  const ButtonTile(title: 'Swith To Host', icon: CustomIcon(color: Colors.green, icon: Icon(Icons.switch_account, color: Colors.white,),)),
         
        
                                const SizedBox(height: 10.0,),
        
                  const ButtonTile(title: 'Accompani Profile', icon: CustomIcon(color: Color.fromARGB(255, 198, 0, 0), icon: Icon(Icons.person_4, color: Colors.white,),)),
         
        
                                const SizedBox(height: 40.0,),
        
        
                  const ButtonTile(title: 'Help & Support', icon: CustomIcon(color: Color.fromARGB(255, 37, 37, 37), icon: Icon(Icons.help, color: Colors.white,),)),
         
        
                                const SizedBox(height: 10.0,),
        
                  const ButtonTile(title: 'Submit Feedback', icon: CustomIcon(color: Color.fromARGB(255, 190, 0, 137), icon: Icon(Icons.send_and_archive, color: Colors.white,),)),
        
        
                                const SizedBox(height: 10.0,),
        
                  const ButtonTile(title: 'App Guide', icon: CustomIcon(color: Color.fromARGB(255, 8, 169, 0), icon: Icon(Icons.double_arrow, color: Colors.white,),)),
                                const SizedBox(height: 30.0,),
        
                GestureDetector(
                      onTap: () {
                         _showCustomDialog(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
          content: 'Are you sure you want to Logout ?',
          onConfirm: () {
            AuthenticationRepository.instance.logout();
          },
        );
      },
    );
  }
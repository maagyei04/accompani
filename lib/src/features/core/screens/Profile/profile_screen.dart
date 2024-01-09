import 'package:accompani/navigation_menu.dart';
import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;

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
                        Row(
                          children: [
                          const CircleAvatar(
                          radius: 30.0,
                          backgroundColor: tSecondaryColor,
                          ),
                        const SizedBox(width: 15.0,),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Linda', style: Theme.of(context).textTheme.displayLarge,),
                                const Text('Guest')
                              ],
                            ),                                                ],
                        ),
                      ],
                    ),
                              const Icon(Icons.edit_note_outlined, size: 40,),
                  ],
                ),
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

                  const ButtonTile(title: 'Trips'), 


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
                         AuthenticationRepository.instance.logout();
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
  }
}

class ButtonTile extends StatelessWidget {
  const ButtonTile({
    super.key,
    required this.title,
    this.screen,
  });

  final String title;
  final Widget? screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => screen);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border:Border.all(
            color: Colors.grey,
            width: 1.0,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.displayMedium,),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
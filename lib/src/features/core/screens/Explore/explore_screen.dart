import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/explore_appbar.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/home_card.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/interest_widget.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/review_card.dart';
import 'package:accompani/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(UserRepository());



    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;
    var heightSize = mediaQuery.size.height;

    return FutureBuilder(
      future: controller.getUserInfoByType(),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExploreAppBar(),

            Center(
              child: HomeCard(
                widthSize: widthSize, 
                heightSize: heightSize,
                picture: tWelcomeImage4,  
                userId: user.userId!,
                name: user.firstName + user.lastName,
                rank: user.rank!,
                rate: user.reviewRate!,
                bio: user.bio,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              width: widthSize,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Me', style: Theme.of(context).textTheme.displayLarge,),
                  Text(user.bio, style: Theme.of(context).textTheme.displayMedium,),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: widthSize,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My Interests', style: Theme.of(context).textTheme.displayLarge,),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: user.interests.length, 
                        itemBuilder: (_, index) {
                        return InterestWidget(interest: user.interests[index]);
                                              
                      }),       
                                             
                    ],
                  )
                ],
              ),
            ),  

            SizedBox(
              width: widthSize - 40,
              child: const Divider()
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Emily's Reviews", style: Theme.of(context).textTheme.displayLarge,),
            ),

            SizedBox(
              height: 180.0,
              child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3, 
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return ReviewCard(
                            widthSize: widthSize,
                            review: '“... Emily received us very well, showed us the whole place, very communicative, and made us super comfortable. She gave the best restaurant referrals too...”   ',  
                            name: 'Charles',
                            time: '2 Weeks ago...',
                          );
                        
                }),
            ),

         
              
            ],
        ),
      ),
    );

      }
    );
    
    
    
    
    
    
  }
}
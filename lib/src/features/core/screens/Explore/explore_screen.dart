import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/explore_appbar.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/home_card.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/interest_widget.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;
    var heightSize = mediaQuery.size.height;

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
                name: 'Emily Todd',
                rank: 'Superhost',
                rate: '4.78',
                bio: "Hello! I'm Emily, a passionate explorer with an insatiable curiosity for the world around me. Whether it's traversing through dense jungles, unraveling historical mysteries, or indulging in culinary delights from every corner of the globe, I'm always up for a new adventure",
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
                  Text("Hello! I'm Emily, a passionate explorer with an insatiable curiosity for the world around me. Whether it's traversing through dense jungles, unraveling historical mysteries, or indulging in culinary delights from every corner of the globe, I'm always up for a new adventure", style: Theme.of(context).textTheme.displayMedium,),
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
                  const Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      InterestWidget(interest: 'Art',),      
                      InterestWidget(interest: 'Road Trips',),   
                      InterestWidget(interest: 'Church',),       
                      InterestWidget(interest: 'Music',),   
                      InterestWidget(interest: 'Nutrition',)                    
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
}
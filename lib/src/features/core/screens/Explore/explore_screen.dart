import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/features/auth/models/user_model.dart';
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
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }

        final List<UserModel> users = snapshot.data!; // Assuming your data type is List<User>

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ExploreAppBar(),

                SizedBox(
                  height: 1100,
                  child: PageView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Center(
                            child: HomeCard(
                              widthSize: widthSize,
                              heightSize: heightSize,
                              picture: users[index].photos[0],
                              userId: users[index].userId!,
                              name: "${users[index].firstName} ${users[index].lastName}",
                              rank: users[index].rank!,
                              rate: users[index].reviewRate!,
                              bio: users[index].bio,
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
                                Text(users[index].bio, style: Theme.of(context).textTheme.displayMedium,),
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
                                    for (var interest in users[index].interests)
                                      InterestWidget(interest: interest),
                                  ],
                                )
                              ],
                            ),
                          ),
                  
                          SizedBox(
                            width: widthSize - 40,
                            child: const Divider(),
                          ),
                  
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text("${users[index].firstName}'s Reviews", style: Theme.of(context).textTheme.displayLarge),
                          ),
                        ],
                      );
                    },
                  ),
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
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

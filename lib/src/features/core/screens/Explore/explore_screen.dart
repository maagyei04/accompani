import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:accompani/src/features/core/screens/Explore/widgets/explore_appbar.dart';
import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
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
          children: [
            const ExploreAppBar(),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: tDarkColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: widthSize,
                  height: heightSize /1.3,
                  margin: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(image: AssetImage(tWelcomeImage4), fit: BoxFit.cover,),
                  ),
                ),         
                       Positioned(
                        bottom: 60,
                        left: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Emily Todd', style: Theme.of(context).textTheme.titleLarge,),
                                const Icon(Icons.verified, color: Colors.yellow,),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.theater_comedy, color: Colors.yellow,),
                                Text('Superhost', style: Theme.of(context).textTheme.labelLarge,),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow,),
                                Text('4.78', style: Theme.of(context).textTheme.labelLarge,),
                              ],
                            ),
                            SizedBox(
                              width: 300,
                              child: Text("Hello! I'm Emily, a passionate explorer with an insatiable curiosity for the world around me. Whether it's traversing through dense jungles, unraveling historical mysteries, or indulging in culinary delights from every corner of the globe, I'm always up for a new adventure",  style: Theme.of(context).textTheme.titleSmall,))
                          ],
                        )
                      ),                
                      const Positioned(
                        top: 25,
                        left: 25,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.yellow,
                        )
                      ),                         
                      const Positioned(
                        top: 30,
                        left: 30,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.yellow,
                          backgroundImage: AssetImage(tWelcomeImage),
                        )
                      ),   
                      const Positioned(
                        bottom: 30,
                        right: 30,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: tPrimaryColor,
                          child: Icon(Icons.send, color: tWhiteColor, size: 30.0,),
                        )
                      ),                                     

              ],
            )
          ],
        ),
      ),
    );
  }
} 
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
                Container(
                  decoration: BoxDecoration(
                    color: tDarkColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: widthSize,
                  height: heightSize /1.3,
                  margin: const EdgeInsets.all(20),   
                  child:  Stack(
                    children : [ 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: const Image(image: AssetImage(tWelcomeImage2), fit: BoxFit.cover,),
                      ),                      
                      const Positioned(
                        top: 10,
                        left: 10,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.yellow,
                          backgroundImage: AssetImage(tWelcomeImage),
                        )
                      ),

                    ]
                  ),
                ),
          ],
        ),
      ),
    );
  }
} 
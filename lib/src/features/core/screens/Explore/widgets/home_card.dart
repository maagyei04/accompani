import 'package:accompani/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.widthSize,
    required this.heightSize,
    required this.picture,
    required this.name,
    required this.rank,
    required this.rate,
    required this.bio,
  });

  final double widthSize;
  final double heightSize;
  final String picture;
  final String name;
  final String rank;
  final String rate;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: Image(image: AssetImage(picture), fit: BoxFit.cover,),
          ),
        ),         
               Positioned(
                bottom: 60,
                left: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(name, style: Theme.of(context).textTheme.titleLarge,),
                          const Icon(Icons.verified, color: Colors.yellow,),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.theater_comedy, color: Colors.yellow,),
                          Text(rank, style: Theme.of(context).textTheme.labelLarge,),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow,),
                          Text(rate, style: Theme.of(context).textTheme.labelLarge,),
                        ],
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(bio,  style: Theme.of(context).textTheme.titleSmall,))
                    ],
                  ),
                )
              ),                
              const Positioned(
                top: 35,
                left: 35,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.yellow,
                )
              ),                         
              Positioned(
                top: 40,
                left: 40,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.yellow,
                  backgroundImage: AssetImage(picture),
                )
              ),   
              const Positioned(
                bottom: 30,
                right: 30,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: tPrimaryColor,
                  child: Icon(Icons.send, color: tWhiteColor, size: 30.0,),
                )
              ),                                     
    
      ],
    );
  }
}
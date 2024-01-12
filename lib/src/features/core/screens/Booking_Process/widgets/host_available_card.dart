import 'package:accompani/src/constants/colors.dart';
import 'package:accompani/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

class HostCard extends StatelessWidget {
  const HostCard({
    super.key,
    required this.screenWidth,
    required this.bio,
    required this.hostTimeJoined,
    required this.name,
    required this.rank,
    required this.rate,
    required this.review,
  });

  final double screenWidth;
  final String name;
  final String rate;
  final String rank;
  final String bio;
  final String review;
  final String hostTimeJoined;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      width: screenWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 45.0,
                    backgroundImage: AssetImage(tWelcomeImage4),
                    backgroundColor: Colors.yellow,
                  ),
                  const SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(name, style: Theme.of(context).textTheme.displayLarge,),
                          const Icon(Icons.verified, color: Colors.yellow,)
                        ],
                      ),
                      Row(
                        children: [
                          Text(rate, style: Theme.of(context).textTheme.displayLarge,),
                          const Icon(Icons.star,)
                        ],                           
                      ),
                      Text(rank),
                    ],
                  ),  
                                      ],
              ),
    
              const Icon(Icons.favorite_border_outlined, size: 30.0,)
            ],
          ),
          const SizedBox(height: 10.0,),
          Text(bio, maxLines: 4, style: const TextStyle(fontSize: 14.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            review,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ), 
                        const SizedBox(width: 10.0,),
                  Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            hostTimeJoined,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ), 
                                              ],
              ),
    
                    IconButton(onPressed: () {}, icon: const Icon(Icons.send, size: 30.0, color: tPrimaryColor,))
                                                                       ],
          ),
        ],
      ),
    );
  }
}
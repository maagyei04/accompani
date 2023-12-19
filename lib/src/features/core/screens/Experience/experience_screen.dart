import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Experience", style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Analytics", style: Theme.of(context).textTheme.bodyMedium,),
          Center(child: Text("Yet To Build The Experience Screen, #Michan", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium,), ),
        ],
      ),
    );
  }
}
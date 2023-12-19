import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Profile", style: Theme.of(context).textTheme.bodyMedium,),
          Center(child: Text("Yet To Build The Profile Screen, #Michan", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium,), ),
        ],
      ),
    );
  }
}
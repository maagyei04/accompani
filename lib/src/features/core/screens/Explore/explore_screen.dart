import 'package:accompani/src/repository/auth_repo/authentication_repository.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Explore", style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Explore", style: Theme.of(context).textTheme.bodyMedium,),
          Center(child: Text("Yet To Build The Explore Screen, #Michan", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium,), ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
                child: const Text("Logout"),
              ),
            ),
      ),
    );
  }
}
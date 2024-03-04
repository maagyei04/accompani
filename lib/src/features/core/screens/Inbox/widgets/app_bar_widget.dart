import 'package:accompani/src/features/auth/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.data,
  });

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(data.photos[0]),
            backgroundColor: Colors.black,
            radius: 20,
          ),
          const SizedBox(width: 5.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.firstName, style: Theme.of(context).textTheme.headlineLarge),
              Text('Accompani', style: Theme.of(context).textTheme.displayMedium),
            ],
          )
        ],
      ),
    );
  }
}
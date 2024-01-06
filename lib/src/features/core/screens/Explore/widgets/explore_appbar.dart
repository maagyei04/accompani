import 'package:accompani/src/common_widgets/appbar/appbar.dart';
import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:flutter/material.dart';

class ExploreAppBar extends StatelessWidget {
  const ExploreAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: const TSearchContainer(
        width: double.infinity,
        text: 'Search To Guide',
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.view_comfortable_outlined, size: 33,)),
      ],
    );
  }
}
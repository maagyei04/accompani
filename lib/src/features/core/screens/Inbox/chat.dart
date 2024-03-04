import 'package:accompani/src/common_widgets/searchbar/search_bar.dart';
import 'package:accompani/src/features/core/screens/Inbox/widgets/chat_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return
       Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          appBar: AppBar(
            centerTitle: true,
            title: Text('Inbox', style: Theme.of(context).textTheme.displayLarge,),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TSearchContainer(
                    width: double.infinity,
                    text: 'Search...',
                    showbackground: false,
                  ),
                ),             
    
                SizedBox(height: 20.0,),
                
                SizedBox(
                  height: 600,
                  child: ChatList(),
                ),
              ],
            ),
          )
        );
      }
}
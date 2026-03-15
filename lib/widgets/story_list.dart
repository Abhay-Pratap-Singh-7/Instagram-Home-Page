import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/widgets/story_avatar.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final mockStories = [
      {
        'user': 'Your story',
        'pic': 'https://i.pravatar.cc/150?img=11',
        'isAdd': true,
      },
      {
        'user': 'flutter_dev',
        'pic': 'https://i.pravatar.cc/150?img=60',
        'isAdd': false,
      },
      {
        'user': 'design_hub',
        'pic': 'https://i.pravatar.cc/150?img=52',
        'isAdd': false,
      },
      {
        'user': 'dart_lang',
        'pic': 'https://i.pravatar.cc/150?img=33',
        'isAdd': false,
      },
      {
        'user': 'flutter_dev',
        'pic': 'https://i.pravatar.cc/150?img=4',
        'isAdd': false,
      },
      {
        'user': 'design_hub',
        'pic': 'https://i.pravatar.cc/150?img=17',
        'isAdd': false,
      },
      {
        'user': 'dart_lang',
        'pic': 'https://i.pravatar.cc/150?img=40',
        'isAdd': false,
      },
    ];

    return Container(
      height: 130,
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        padding: const EdgeInsets.only(left: 2, top: 8.0, bottom: 8.0),

        physics: const BouncingScrollPhysics(),

        itemCount: mockStories.length,

        itemBuilder: (context, index) {
          final story = mockStories[index];
          final bool isAddButton = story['isAdd'] as bool;
          final String username = story['user'] as String;
          final String pic = story['pic'] as String;

          return StoryAvatar(
            avatarUrl: pic,
            username: username,
            isAddStory: isAddButton,
          );
        },
      ),
    );
  }
}

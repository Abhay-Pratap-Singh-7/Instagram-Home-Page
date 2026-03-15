import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/models/post_model.dart';
import 'package:instagram_feed_clone/widgets/post_header.dart';
import 'package:instagram_feed_clone/widgets/post_media.dart';
import 'package:instagram_feed_clone/widgets/post_actions.dart';
import 'package:instagram_feed_clone/widgets/post_caption.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          PostHeader(post: post),
          PostMedia(post: post),
          PostActions(post: post),
          PostCaption(post: post),
        ],
      ),
    );
  }
}

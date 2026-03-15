import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/models/post_model.dart';
import 'package:instagram_feed_clone/utils/snackbar_util.dart';

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(post.userAvatar),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Text(
              post.username,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              SnackbarUtil.showUnimplementedFeature(context, 'More options');
            },
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

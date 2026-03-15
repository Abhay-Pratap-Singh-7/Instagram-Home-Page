import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/models/post_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: post.userAvatar,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              memCacheWidth: 100,
              placeholder: (context, url) => Container(color: Colors.grey[300]),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                child: const Icon(Icons.person, size: 16),
              ),
            ),
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

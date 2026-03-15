import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/models/post_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:instagram_feed_clone/providers/feed_provider.dart';
import 'package:instagram_feed_clone/widgets/like_animation.dart';
import 'package:instagram_feed_clone/utils/snackbar_util.dart';

class PostActions extends StatelessWidget {
  final Post post;

  const PostActions({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FeedProvider>();

    final numberFormat = NumberFormat('#,###');

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => provider.toggleLike(post.postId),
                icon: LikeAnimation(
                  isAnimating: post.isLiked,
                  smallLike: true,
                  child: Icon(
                    post.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: post.isLiked
                        ? Colors.red
                        : Colors.black,
                    size: 28,
                  ),
                ),
              ),
              Text(
                numberFormat.format(post.likes),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              IconButton(
                onPressed: () {
                  SnackbarUtil.showUnimplementedFeature(context, 'Comments');
                },
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                  size: 26,
                ),
              ),
              IconButton(
                onPressed: () {
                  SnackbarUtil.showUnimplementedFeature(context, 'Share');
                },
                icon: const Icon(
                  Icons.send_outlined,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () => provider.toggleSave(post.postId),
            icon: Icon(
              post.isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

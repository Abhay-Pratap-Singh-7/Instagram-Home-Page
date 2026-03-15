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
    final postState = context
        .select<FeedProvider, ({int likes, bool isLiked, bool isSaved})>(
          (provider) =>
              (likes: post.likes, isLiked: post.isLiked, isSaved: post.isSaved),
        );
    final provider = context.read<FeedProvider>();
    final numberFormat = NumberFormat('#,###');
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => provider.toggleLike(post.postId),
                icon: LikeAnimation(
                  isAnimating: postState.isLiked,
                  smallLike: true,
                  child: Image.asset(
                    postState.isLiked
                        ? 'assets/Icons/Like (Filled).png'
                        : 'assets/Icons/Like.png',
                    color: postState.isLiked ? Colors.red : Colors.black,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              RepaintBoundary(
                child: Text(
                  numberFormat.format(postState.likes),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  SnackbarUtil.showUnimplementedFeature(context, 'Comments');
                },
                icon: Image.asset(
                  'assets/Icons/Comment.png',
                  color: Colors.black,
                  width: 26,
                  height: 26,
                ),
              ),
              IconButton(
                onPressed: () {
                  SnackbarUtil.showUnimplementedFeature(context, 'Share');
                },
                icon: Image.asset(
                  'assets/Icons/Share.png',
                  color: Colors.black,
                  width: 26,
                  height: 26,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () => provider.toggleSave(post.postId),
            icon: Image.asset(
              postState.isSaved
                  ? 'assets/Icons/Save (Filled).png'
                  : 'assets/Icons/Save.png',
              color: Colors.black,
              width: 28,
              height: 28,
            ),
          ),
        ],
      ),
    );
  }
}

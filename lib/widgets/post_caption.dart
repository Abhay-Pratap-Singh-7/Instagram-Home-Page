import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/models/post_model.dart';

class PostCaption extends StatelessWidget {
  final Post post;
  const PostCaption({super.key, required this.post});
  String _getTimeAgo(DateTime timestamp) {
    final difference = DateTime.now().difference(timestamp);
    if (difference.inDays > 0) {
      if (difference.inDays == 1) return '1 DAY AGO';
      return '${difference.inDays} DAYS AGO';
    } else if (difference.inHours > 0) {
      if (difference.inHours == 1) return '1 HOUR AGO';
      return '${difference.inHours} HOURS AGO';
    } else if (difference.inMinutes > 0) {
      if (difference.inMinutes == 1) return '1 MINUTE AGO';
      return '${difference.inMinutes} MINUTES AGO';
    } else {
      return 'JUST NOW';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: '${post.username} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post.caption),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _getTimeAgo(post.timestamp),
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

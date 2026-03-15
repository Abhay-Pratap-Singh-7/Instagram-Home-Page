import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/models/post_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:instagram_feed_clone/widgets/like_animation.dart';
import 'package:provider/provider.dart';
import 'package:instagram_feed_clone/providers/feed_provider.dart';
import 'package:pinch_to_zoom_scrollable/pinch_to_zoom_scrollable.dart';

class PostMedia extends StatefulWidget {
  final Post post;
  const PostMedia({super.key, required this.post});
  @override
  State<PostMedia> createState() => _PostMediaState();
}

class _PostMediaState extends State<PostMedia> {
  int _currentIndex = 0;
  bool isLikeAnimating = false;
  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.post.imageUrls;
    if (imageUrls.isEmpty) {
      return Container(
        color: Colors.grey[200],
        child: const AspectRatio(
          aspectRatio: 1.0,
          child: Center(child: Text('No Image Available')),
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.grey[200],
          child: AspectRatio(
            aspectRatio: 1.0,
            child: PageView.builder(
              itemCount: imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return PinchToZoomScrollableWidget(
                  maxScale: 3,
                  child: GestureDetector(
                    onDoubleTap: () {
                      final provider = context.read<FeedProvider>();
                      if (!widget.post.isLiked) {
                        provider.toggleLike(widget.post.postId);
                      }
                      setState(() {
                        isLikeAnimating = true;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl: imageUrls[index],
                            fit: BoxFit.cover,
                            fadeInDuration: const Duration(milliseconds: 100),
                            memCacheWidth: 600,
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error, color: Colors.red),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: isLikeAnimating ? 1 : 0,
                          child: LikeAnimation(
                            isAnimating: isLikeAnimating,
                            duration: const Duration(milliseconds: 400),
                            onEnd: () {
                              setState(() {
                                isLikeAnimating = false;
                              });
                            },
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (imageUrls.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  width: 6.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

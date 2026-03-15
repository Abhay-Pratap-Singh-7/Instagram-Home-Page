import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StoryAvatar extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final bool isAddStory;
  const StoryAvatar({
    super.key,
    required this.avatarUrl,
    required this.username,
    this.isAddStory = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 88,
                height: 88,
                alignment: Alignment.center,
                decoration: isAddStory
                    ? null
                    : const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.pink,
                            Colors.orangeAccent,
                            Colors.yellow,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: avatarUrl,
                      width: 74,
                      height: 74,
                      fit: BoxFit.cover,
                      memCacheWidth: 200,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[300]),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.person, size: 30),
                      ),
                    ),
                  ),
                ),
              ),
              if (isAddStory)
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(Icons.add, color: Colors.white, size: 18),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 80,
            child: Text(
              username,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

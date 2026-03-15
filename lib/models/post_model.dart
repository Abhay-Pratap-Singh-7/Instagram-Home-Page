class Post {
  final String postId;
  final String username;
  final String userAvatar;
  final List<String> imageUrls;
  final String caption;
  int likes;
  bool isLiked;
  bool isSaved;
  final DateTime timestamp;

  Post({
    required this.postId,
    required this.username,
    required this.userAvatar,
    required this.imageUrls,
    required this.caption,
    required this.likes,
    this.isLiked = false,
    this.isSaved = false,
    required this.timestamp,
  });
}

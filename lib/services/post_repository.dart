import 'package:instagram_feed_clone/models/post_model.dart';

class PostRepository {
  final List<Post> _mockDatabase = [
    Post(
      postId: '1',
      username: 'flutter_dev',
      userAvatar: 'https://i.pravatar.cc/150?img=11',
      imageUrls: [
        'https://picsum.photos/seed/p1_1/600/600',
        'https://picsum.photos/seed/p1_2/600/600',
        'https://picsum.photos/seed/p1_3/600/600',
        'https://picsum.photos/seed/p1_4/600/600',
        'https://picsum.photos/seed/p1_5/600/600',
      ],
      caption: 'Building an Instagram clone with Flutter! 💙 #flutter #dev',
      likes: 124,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    Post(
      postId: '2',
      username: 'nature_lover',
      userAvatar: 'https://i.pravatar.cc/150?img=40',
      imageUrls: ['https://picsum.photos/seed/p2/600/600'],
      caption: 'Enjoying the great outdoors today! 🌲🏔️',
      likes: 456,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Post(
      postId: '3',
      username: 'ui_designer',
      userAvatar: 'https://i.pravatar.cc/150?img=32',
      imageUrls: [
        'https://picsum.photos/seed/p3_1/600/600',
        'https://picsum.photos/seed/p3_2/600/600',
        'https://picsum.photos/seed/p3_3/600/600',
        'https://picsum.photos/seed/p3_4/600/600',
      ],
      caption: 'Look at this beautiful UI design 🎨 #design',
      likes: 89,
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    Post(
      postId: '4',
      username: 'foodie_journey',
      userAvatar: 'https://i.pravatar.cc/150?img=19',
      imageUrls: [
        'https://picsum.photos/seed/p4_1/600/600',
        'https://picsum.photos/seed/p4_2/600/600',
        'https://picsum.photos/seed/p4_3/600/600',
        'https://picsum.photos/seed/p4_4/600/600',
        'https://picsum.photos/seed/p4_5/600/600',
      ],
      caption: 'Best meals from my trip to Italy 🍝🍷',
      likes: 312,
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Post(
      postId: '5',
      username: 'cat_mom',
      userAvatar: 'https://i.pravatar.cc/150?img=5',
      imageUrls: ['https://picsum.photos/seed/p5/600/600'],
      caption: 'Look at my cute cat sleeping! 😻',
      likes: 890,
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
    ),
    Post(
      postId: '6',
      username: 'tech_guru',
      userAvatar: 'https://i.pravatar.cc/150?img=60',
      imageUrls: [
        'https://picsum.photos/seed/p6_1/600/600',
        'https://picsum.photos/seed/p6_2/600/600',
        'https://picsum.photos/seed/p6_3/600/600',
        'https://picsum.photos/seed/p6_4/600/600',
      ],
      caption: 'My new desk setup is finally complete 💻🔥',
      likes: 1056,
      timestamp: DateTime.now().subtract(const Duration(hours: 12)),
    ),
  ];

  Future<List<Post>> fetchPosts(int page) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    return _mockDatabase.map((post) {
      return Post(
        postId: '${post.postId}_page_$page',
        username: post.username,
        userAvatar: post.userAvatar,
        imageUrls: post.imageUrls,
        caption: post.caption,
        likes: post.likes + page,
        timestamp: post.timestamp,
        isLiked: false,
        isSaved: false,
      );
    }).toList();
  }
}

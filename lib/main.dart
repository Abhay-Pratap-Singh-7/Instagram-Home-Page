import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instagram_feed_clone/providers/feed_provider.dart';
import 'package:instagram_feed_clone/screens/home_feed_screen.dart';

void main() {
  runApp(const InstagramFeedApp());
}

class InstagramFeedApp extends StatelessWidget {
  const InstagramFeedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FeedProvider())],
      child: const MaterialApp(
        title: 'Instagram Feed Clone',
        home: HomeFeedScreen(),
      ),
    );
  }
}

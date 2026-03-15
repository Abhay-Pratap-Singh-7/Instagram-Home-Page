import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instagram_feed_clone/providers/feed_provider.dart';
import 'package:instagram_feed_clone/widgets/app_top_bar.dart';
import 'package:instagram_feed_clone/widgets/story_list.dart';
import 'package:instagram_feed_clone/widgets/post_card.dart';
import 'package:instagram_feed_clone/widgets/shimmer_post_card.dart';
import 'package:instagram_feed_clone/widgets/shimmer_story_list.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});
  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 1000) {
      final provider = Provider.of<FeedProvider>(context, listen: false);
      if (!provider.isFetchingMore) {
        provider.fetchMorePosts();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppTopBar(),
      body: Selector<FeedProvider, bool>(
        selector: (_, provider) => provider.isLoading,
        builder: (context, isLoading, _) {
          if (isLoading) {
            return ListView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const ShimmerStoryList();
                }
                return const ShimmerPostCard();
              },
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            child:
                Selector<FeedProvider, ({int postCount, bool isFetchingMore})>(
                  selector: (_, provider) => (
                    postCount: provider.posts.length,
                    isFetchingMore: provider.isFetchingMore,
                  ),
                  shouldRebuild: (prev, next) =>
                      prev.postCount != next.postCount ||
                      prev.isFetchingMore != next.isFetchingMore,
                  builder: (context, data, _) {
                    final postCount = data.postCount;
                    final isFetchingMore = data.isFetchingMore;
                    return ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      addAutomaticKeepAlives: true,
                      addRepaintBoundaries: true,
                      itemCount: postCount == 0 ? 2 : postCount + 2,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const RepaintBoundary(child: StoryList());
                        }
                        if (postCount == 0) {
                          return const _EmptyFeedMessage();
                        }
                        if (index == postCount + 1) {
                          if (isFetchingMore) {
                            return const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        }
                        final post = context
                            .read<FeedProvider>()
                            .posts[index - 1];
                        return PostCard(post: post);
                      },
                    );
                  },
                ),
          );
        },
      ),
    );
  }
}

class _EmptyFeedMessage extends StatelessWidget {
  const _EmptyFeedMessage();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt_outlined, size: 80, color: Colors.black87),
          SizedBox(height: 16),
          Text(
            'No Posts Yet',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Follow more people to see photos and videos in your feed.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

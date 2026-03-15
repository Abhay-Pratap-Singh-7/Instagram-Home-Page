import 'package:flutter/material.dart';
import 'package:instagram_feed_clone/models/post_model.dart';
import 'package:instagram_feed_clone/services/post_repository.dart';

class FeedProvider extends ChangeNotifier {
  final PostRepository _repository = PostRepository();
  final List<Post> _posts = [];
  bool _isLoading = true;
  bool _isFetchingMore = false;
  int _currentPage = 0;
  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  bool get isFetchingMore => _isFetchingMore;
  FeedProvider() {
    _loadInitialPosts();
  }
  Future<void> _loadInitialPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final newPosts = await _repository.fetchPosts(_currentPage);
      _posts.addAll(newPosts);
      _currentPage++;
    } catch (e) {
      debugPrint('Error loading initial posts: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMorePosts() async {
    if (_isFetchingMore || _isLoading) return;
    _isFetchingMore = true;
    notifyListeners();
    try {
      final newPosts = await _repository.fetchPosts(_currentPage);
      _posts.addAll(newPosts);
      _currentPage++;
    } catch (e) {
      debugPrint('Error fetching more posts: $e');
    }
    _isFetchingMore = false;
    notifyListeners();
  }

  void toggleLike(String postId) {
    final postIndex = _posts.indexWhere((p) => p.postId == postId);
    if (postIndex != -1) {
      final post = _posts[postIndex];
      post.isLiked = !post.isLiked;
      if (post.isLiked) {
        post.likes++;
      } else {
        post.likes--;
      }
      notifyListeners();
    }
  }

  void toggleSave(String postId) {
    final postIndex = _posts.indexWhere((p) => p.postId == postId);
    if (postIndex != -1) {
      _posts[postIndex].isSaved = !_posts[postIndex].isSaved;
      notifyListeners();
    }
  }
}

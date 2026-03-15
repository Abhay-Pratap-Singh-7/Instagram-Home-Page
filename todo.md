# Flutter Instagram Feed Assignment — Complete Chronological Checklist

## Phase 1 — Understand the Requirements
- [x] Read the assignment and list all **mandatory features**.
- [x] Install the **Instagram app** and observe the **Home Feed UI carefully**.
- [x] Note the exact components:
  - [x] Top bar (logo, notifications, messages)
  - [x] Stories tray
  - [x] Post feed
- [x] Observe **spacing, paddings, fonts, icon sizes**.
- [x] Observe **scroll physics and animation speed**.
- [x] Identify all interactions required (Carousel, Pinch-to-Zoom, Like, Save, Snackbar).
- [x] Confirm required architecture (models, widgets, services, state management).
- [x] Confirm performance requirements (shimmer, pagination, cached images).

## Phase 2 — Project Setup
### Create Project
- [x] Create Flutter project (`flutter create instagram_feed_clone`)
- [x] Open project in VS Code / Android Studio.

### Initialize Git
- [x] Create Git repository.
- [x] Commit initial project.
- [ ] Push to GitHub.

### Clean default project
- [x] Remove demo counter code.
- [x] Setup basic app structure.

## Phase 3 — Create Proper Architecture
- [x] Create folder structure immediately:
  - `models/`
  - `services/`
  - `providers/`
  - `widgets/`
  - `screens/`
  - `utils/`
  - `effects/`

## Phase 4 — Install Required Packages
- [x] Add dependencies in `pubspec.yaml`:
  - `cached_network_image`
  - `provider`
  - `shimmer`
  - `flutter_svg`
- [x] Run `flutter pub get`
- [x] Test project builds successfully

## Phase 5 — Create Data Models
### Post Model
- [x] postId, username, userAvatar, imageUrls (List), caption, likes, isLiked, isSaved, timestamp
### User Model
- [x] username, avatar
- [x] Ensure models support multiple images and interaction state

## Phase 6 — Mock Data Repository
- [x] Create `PostRepository` class.
- [x] Implement method `Future<List<Post>> fetchPosts(int page)`
- [x] Add 1.5 second artificial delay.
- [x] Return basic hardcoded mock data list (with unique IDs added per page for infinite scroll).

## Phase 7 — State Management Setup
Choose one: Provider / Riverpod / Bloc

Implementation checklist:
- [x] Create `FeedProvider`
- [x] Manage:
  - [x] post list
  - [x] loading state
  - [x] pagination
  - [x] like/save toggle
- [x] Add provider to `main.dart`

## Phase 8 — Build App Layout
### HomeFeedScreen
Structure:
```
Scaffold
 └ ListView
      ├ StoriesTray
      ├ PostCard
      ├ PostCard
```
Checklist:
- [x] Scrollable feed
- [x] Lazy loading support
- [x] Smooth scroll physics

## Phase 9 — Build Top Bar
- [x] Instagram logo
- [x] notification icon
- [x] message icon
- [x] correct spacing, icon sizes, safe area handling

## Phase 10 — Stories Tray
- [x] implement horizontal ListView
- [x] create `StoryAvatar` widget
- [x] spacing identical to Instagram, gradient border, username text

## Phase 11 — Post Card Layout
- [x] PostHeader (avatar, username, more options)
- [x] PostMedia (image/carousel)
- [x] PostActions (like, comment, share, save)
- [x] PostCaption (username, caption, timestamp)

## Phase 12 — Carousel Support
- [x] Implement `PageView`
- [x] Horizontal swipe, Smooth animation
- [x] Create `CarouselIndicator` widget (dot indicator)

## Phase 13 — Pinch to Zoom Feature
- [ ] Detect pinch gesture
- [ ] Scale image
- [ ] Overlay on UI
- [ ] Animate back when released

## Phase 14 — Stateful Interactions
- [x] Like Button: Toggle state, Animate heart
- [x] Save Button: Toggle bookmark state
- [x] State should persist while scrolling.

## Phase 15 — Snackbar for Unimplemented Buttons
- [x] show custom snackbar for comment and share
- [x] auto disappear after few seconds

## Phase 16 — Image Loading Strategy
- [x] Use `cached_network_image`
- [x] Add placeholder and error widget

## Phase 17 — Shimmer Loading State
- [x] Create `ShimmerPostCard`
- [x] Display shimmer placeholders
- [x] Replace with real posts after load

## Phase 18 — Infinite Scroll Pagination
- [x] Detect scroll position with ScrollController
- [x] When 2 posts before end, load more

## Phase 19 — Edge Case Handling
- [x] network image failure, empty feed, loading state, slow loading, pagination loading indicator

## Phase 20 — Performance Optimization
- [ ] Use `const` widgets, `RepaintBoundary`, `ListView.builder`, avoid rebuilds

## Phase 21 — UI Pixel Perfection Pass
- [ ] Verify padding, sizes, typography, etc.

## Phase 22 — Create README
- [ ] Write documentation

## Phase 23 — Record Demo Video
- [ ] Demo interactions and implementation

## Phase 24 — Final Submission Checklist
- [ ] Verify all requirements are met

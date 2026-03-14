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
- [ ] Create Git repository.
- [ ] Commit initial project.
- [ ] Push to GitHub.

### Clean default project
- [ ] Remove demo counter code.
- [ ] Setup basic app structure.

## Phase 3 — Create Proper Architecture
- [ ] Create folder structure immediately:
  - `models/`
  - `services/`
  - `providers/`
  - `widgets/`
  - `screens/`
  - `utils/`
  - `effects/`

## Phase 4 — Install Required Packages
- [ ] Add dependencies in `pubspec.yaml`:
  - `cached_network_image`
  - `provider`
  - `shimmer`
  - `flutter_svg`
- [ ] Run `flutter pub get`
- [ ] Test project builds successfully

## Phase 5 — Create Data Models
### Post Model
- [ ] postId, username, userAvatar, imageUrls (List), caption, likes, isLiked, isSaved, timestamp
### User Model
- [ ] username, avatar, isStorySeen
- [ ] Ensure models support multiple images and interaction state

## Phase 6 — Mock Data Repository
- [ ] Create `PostRepository` class.
- [ ] Implement method `Future<List<Post>> fetchPosts(int page)`
- [ ] Add 1.5 second artificial delay.
- [ ] Return mock data list.
- [ ] Generate random post images from URLs.

## Phase 7 — State Management Setup
- [ ] Create `FeedProvider` with Provider.
- [ ] Manage post list, loading state, pagination, like/save toggle.
- [ ] Add provider to `main.dart`.

## Phase 8 — Build App Layout
- [ ] Scrollable feed (Scaffold > ListView > StoriesTray, PostCard)
- [ ] Lazy loading support
- [ ] Smooth scroll physics

## Phase 9 — Build Top Bar
- [ ] Instagram logo
- [ ] notification icon
- [ ] message icon
- [ ] correct spacing, icon sizes, safe area handling

## Phase 10 — Stories Tray
- [ ] implement horizontal ListView
- [ ] create `StoryAvatar` widget
- [ ] spacing identical to Instagram, gradient border, username text

## Phase 11 — Post Card Layout
- [ ] PostHeader (avatar, username, more options)
- [ ] PostMedia (image/carousel)
- [ ] PostActions (like, comment, share, save)
- [ ] PostCaption (username, caption, timestamp)

## Phase 12 — Carousel Support
- [ ] Implement `PageView`
- [ ] Horizontal swipe, Smooth animation
- [ ] Create `CarouselIndicator` widget (dot indicator)

## Phase 13 — Pinch to Zoom Feature
- [ ] Detect pinch gesture
- [ ] Scale image
- [ ] Overlay on UI
- [ ] Animate back when released

## Phase 14 — Stateful Interactions
- [ ] Like Button: Toggle state, Animate heart
- [ ] Save Button: Toggle bookmark state
- [ ] State should persist while scrolling.

## Phase 15 — Snackbar for Unimplemented Buttons
- [ ] show custom snackbar for comment and share
- [ ] auto disappear after few seconds

## Phase 16 — Image Loading Strategy
- [ ] Use `cached_network_image`
- [ ] Add placeholder and error widget

## Phase 17 — Shimmer Loading State
- [ ] Create `ShimmerPostCard`
- [ ] Display shimmer placeholders
- [ ] Replace with real posts after load

## Phase 18 — Infinite Scroll Pagination
- [ ] Detect scroll position with ScrollController
- [ ] When 2 posts before end, load more

## Phase 19 — Edge Case Handling
- [ ] network image failure, empty feed, loading state, slow loading, pagination loading indicator

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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_feed_clone/utils/snackbar_util.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          SnackbarUtil.showUnimplementedFeature(context, 'Media upload');
        },
        icon: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      title: SizedBox(
        height: 38,
        child: SvgPicture.asset(
          'assets/instagram.svg',
          height: 30,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            SnackbarUtil.showUnimplementedFeature(context, 'Notifications');
          },
          icon: Image.asset(
            'assets/Icons/Like.png',
            color: Colors.black,
            width: 28,
            height: 28,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

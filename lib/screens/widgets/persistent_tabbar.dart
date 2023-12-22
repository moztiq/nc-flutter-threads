import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: isDarkMode(context) ? Colors.black : Colors.white,
      child: TabBar(
        labelPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        indicatorColor: isDarkMode(context) ? Colors.white : Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: isDarkMode(context) ? Colors.white : Colors.black,
        tabs: [
          Text(
            'Threads',
            style: TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
          Text(
            'Replies',
            style: TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

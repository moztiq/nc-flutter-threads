import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.black,
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
    return false;
  }
}

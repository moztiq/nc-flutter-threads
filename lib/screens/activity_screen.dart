import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';

final tabs = [
  'All',
  'Follows',
  'Replies',
  'Mentions',
  'Quotes',
  'Reposts',
  'Verified'
];

List<Map<String, dynamic>> activityList = [
  {
    "id": "cmello510",
    "name": "Mentioned you",
    "description": "Hear's thread you should follow if you love botany @jane",
    "image":
        "https://i.pinimg.com/280x280_RS/c4/92/43/c49243b39355f3d6e7c5ae4608e375a3.jpg",
    "isFollowed": false,
    "time": "4h",
    "icon": FontAwesomeIcons.arrowLeft,
    "icon_color": Colors.green,
  },
  {
    "id": "matveevaangelin",
    "name": "Starting out my gardening club with..",
    "description": "Count me in!",
    "image":
        "https://i.pinimg.com/280x280_RS/1b/ed/d6/1bedd61fca441a55809ed9fe5c268057.jpg",
    "isFollowed": false,
    "time": "4h",
    "icon": FontAwesomeIcons.recycle,
    "icon_color": Colors.blue,
  },
  {
    "id": "axellevanmoer",
    "name": "Followed you",
    "image":
        "https://i.pinimg.com/280x280_RS/6f/ba/eb/6fbaeb9cbc9a2d1ad1aaa3d1dd7e51d8.jpg",
    "isFollowed": true,
    "time": "5h",
    "icon": FontAwesomeIcons.paperPlane,
    "icon_color": Colors.red,
  },
  {
    "id": "Janne",
    "name": "Definitely broken!",
    "image":
        "https://i.pinimg.com/280x280_RS/1c/48/4a/1c484ae2c8ad6ee037e6ff8fa8fa8d4b.jpg",
    "isFollowed": false,
    "time": "5h",
    "icon": FontAwesomeIcons.dailymotion,
    "icon_color": Colors.cyan,
  },
  {
    "id": "TheRealWhisperer",
    "name": "Nice to meet you",
    "image":
        "https://i.pinimg.com/280x280_RS/37/47/e7/3747e7aee5dea96b12e4fb867c85ef89.jpg",
    "isFollowed": false,
    "time": "7h",
    "icon": FontAwesomeIcons.oilCan,
    "icon_color": Colors.amber,
  },
];

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Activity',
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size32,
              fontWeight: FontWeight.bold,
              // letterSpacing: 0.1,
            ),
          ),
          bottom: TabBar(
            padding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            dividerColor: Colors.white,
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                Sizes.size10,
              ),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelPadding: EdgeInsets.symmetric(
              horizontal: Sizes.size5,
            ),
            tabs: [
              for (var tab in tabs)
                Tab(
                  child: Container(
                    width: Sizes.size96 + Sizes.size24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        // color: Colors.grey.shade400,
                        width: Sizes.size1,
                      ),
                      borderRadius: BorderRadius.circular(
                        Sizes.size10,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(tab),
                    ),
                  ),
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: activityList.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: Sizes.size20,
                            backgroundImage: NetworkImage(
                              activityList[index]['image'],
                            ),
                          ),
                          Positioned(
                            right: -4,
                            bottom: -4,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: Sizes.size2,
                                ),
                              ),
                              width: Sizes.size24,
                              height: Sizes.size24,
                              child: Container(
                                alignment: Alignment.center,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                  color: activityList[index]['icon_color'],
                                ),
                                child: FaIcon(
                                  activityList[index]['icon'],
                                  color: Colors.white,
                                  size: Sizes.size12,
                                ),
                              ),
                              // child: const Center(
                              //   child: Text(
                              //     '+',
                              //     style: TextStyle(
                              //       fontSize: Sizes.size14,
                              //       fontWeight: FontWeight.w600,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // ),
                            ),
                          )
                        ],
                      ),
                      title: Row(
                        children: [
                          Text(
                            activityList[index]['id'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h10,
                          Text(
                            activityList[index]['time'],
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(activityList[index]['name']),
                      trailing: activityList[index]['isFollowed']
                          ? GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: Sizes.size5,
                                  horizontal: Sizes.size24,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                child: Text(
                                  'Following',
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                  Row(
                    children: [
                      Gaps.h72,
                      if (activityList[index]['description'] != null)
                        Expanded(
                          child: Text(
                            '${activityList[index]['description']}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Gaps.v10,
                  Row(
                    children: [
                      Gaps.h72,
                      Expanded(
                        child: Divider(
                          height: 0,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text('Nothing to see here yet'),
              )
          ],
        ),
      ),
    );
  }
}

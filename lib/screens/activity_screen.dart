import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/utils.dart';

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
        "https://media.istockphoto.com/id/1311977351/photo/focused-on-success-and-growth.jpg?s=612x612&w=0&k=20&c=ZC4825QyArXmHB_quCjr184x1xm_mEDKGq3-52KVh7w=",
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
        "https://media.istockphoto.com/id/1420486889/photo/candid-portrait-of-young-middle-eastern-digital-native.jpg?s=612x612&w=0&k=20&c=SV7ZhKg7qCeL6oYZGBaIxqfTTrQZu08kndvIKqdL_PI=",
    "isFollowed": false,
    "time": "4h",
    "icon": FontAwesomeIcons.recycle,
    "icon_color": Colors.blue,
  },
  {
    "id": "axellevanmoer",
    "name": "Followed you",
    "image":
        "https://media.istockphoto.com/id/1432226243/photo/happy-young-woman-of-color-smiling-at-the-camera-in-a-studio.jpg?s=612x612&w=0&k=20&c=rk75Rl4PTtXbEyj7RgSz_pJPlgEpUEsgcJVNGQZbrMw=",
    "isFollowed": true,
    "time": "5h",
    "icon": FontAwesomeIcons.paperPlane,
    "icon_color": Colors.red,
  },
  {
    "id": "Janne",
    "name": "Definitely broken!",
    "image":
        "https://media.istockphoto.com/id/1388913352/photo/lovely-business-man-attending-a-meeting-online-writing-stuff-down.jpg?s=612x612&w=0&k=20&c=xkrlDeFMcPOoelyiWd_FwuFOuGi23Fd-t18CxR15okE=",
    "isFollowed": false,
    "time": "5h",
    "icon": FontAwesomeIcons.dailymotion,
    "icon_color": Colors.cyan,
  },
  {
    "id": "TheRealWhisperer",
    "name": "Nice to meet you",
    "image":
        "https://media.istockphoto.com/id/1339296498/photo/beautiful-mid-adult-woman-walking-and-texting-message-on-mobile-phone-outside-business-center.jpg?s=612x612&w=0&k=20&c=YW6PQ28LuVnzqhJh-s3TA1SogZ8uotTBdDU1Mr1a2sY=",
    "isFollowed": false,
    "time": "7h",
    "icon": FontAwesomeIcons.oilCan,
    "icon_color": Colors.amber,
  },
];

class ActivityScreen extends StatelessWidget {
  static const String routeName = "activity";
  static const String routeURL = "/activity";

  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'Activity',
            style: TextStyle(
              fontSize: Sizes.size32,
              fontWeight: FontWeight.bold,
              // letterSpacing: 0.1,
            ),
          ),
          bottom: TabBar(
            padding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            dividerColor: isDarkMode(context) ? Colors.black : Colors.white,
            isScrollable: true,
            indicator: BoxDecoration(
              color: isDarkMode(context) ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(
                Sizes.size10,
              ),
            ),
            labelColor: isDarkMode(context) ? Colors.black : Colors.white,
            unselectedLabelColor:
                isDarkMode(context) ? Colors.white : Colors.black,
            labelPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size5,
            ),
            tabs: [
              for (var tab in tabs)
                Tab(
                  child: Container(
                    width: Sizes.size96 + Sizes.size24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            isDarkMode(context) ? Colors.white : Colors.black,
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
                                  width: Sizes.size1,
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
                            ),
                          )
                        ],
                      ),
                      title: Row(
                        children: [
                          Text(
                            activityList[index]['id'],
                            style: const TextStyle(
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
                                padding: const EdgeInsets.symmetric(
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
                                child: const Text(
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
                            style: const TextStyle(
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
              const Center(
                child: Text('Nothing to see here yet'),
              )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/settings_screen.dart';
import 'package:nc_flutter_threads/screens/widgets/persistent_tabbar.dart';
import 'package:nc_flutter_threads/screens/widgets/post.dart';
import 'package:nc_flutter_threads/utils.dart';

const list = [
  {
    "profile_pic_url":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/220906_Park_Eun_bin_Photoshoot_for_Marie_Claire_Korea.jpg/250px-220906_Park_Eun_bin_Photoshoot_for_Marie_Claire_Korea.jpg",
    "username": "_epark",
    "text": "‘화이트 데이에 사탕을 선물하고 싶은 연예인’ 1위에 배우 박은빈과 아이돌 뉴진스가 꼽혔다. ",
    "images": [
      "https://img.wkorea.com/w/2022/08/style_62e744d8e1020.jpg",
      "https://cdn.entermedia.co.kr/news/photo/202008/18151_36061_2738.jpg",
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202112/02/97a7340f-e449-40ef-9fcf-531216779e89.jpg",
    ],
    "reply_images": [
      "https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202303/13/sbsnoriter/20230313145738118regu.jpg",
      "https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202305/18/kinolights/20230518110853325ameh.jpg",
    ],
    "elapsed_time": "2m",
    "reply_count": 2,
    "like_count": 391
  },
  {
    "profile_pic_url":
        "https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202303/13/sbsnoriter/20230313145738118regu.jpg",
    "username": "shinin",
    "text": "지난 11월 27일 점등된 서울시청 앞 광장 크리스마스트리는 '겨울'하면 가장 먼저 떠오르는 곳이다. ",
    "reply_images": [
      "https://media.istockphoto.com/id/1472242925/ko/%EC%82%AC%EC%A7%84/%EC%BE%8C%ED%99%9C%ED%95%9C-%EA%B8%8D%EC%A0%95%EC%A0%81%EC%9D%B8-%EC%97%AC%EC%9E%90%EA%B0%80-%EA%B4%91%EA%B3%A0%EB%A5%BC-%EC%9C%84%ED%95%9C-%EA%B3%B5%EA%B0%84%EC%9D%84-%EB%B3%B4%EC%97%AC%EC%A3%BC%EB%8A%94-%EC%86%90%EA%B0%80%EB%9D%BD%EC%9D%84-%EA%B0%80%EB%A6%AC%ED%82%A4%EA%B3%A0-%EC%9E%88%EB%8B%A4.jpg?s=2048x2048&w=is&k=20&c=eVMF2_YPx1penNxo1G-5sgtAErCSsKRKmHLe_Im1TTY=",
      "https://media.istockphoto.com/id/1416048929/photo/woman-working-on-laptop-online-checking-emails-and-planning-on-the-internet-while-sitting-in.jpg?s=2048x2048&w=is&k=20&c=6omJSQtYXI93gG8zTc2aCJOCJrqBf-Bk8b_W-IXvy9s=",
      "https://media.istockphoto.com/id/1289220545/photo/beautiful-woman-smiling-with-crossed-arms.jpg?s=2048x2048&w=is&k=20&c=9oGG0ky5YdK2J5Qy1RIdVRJFV8U3DEBbMCq10aTxTPY=",
    ],
    "elapsed_time": "5m",
    "reply_count": 123,
    "like_count": '1k'
  },
  {
    "profile_pic_url":
        "https://media.licdn.com/dms/image/C5603AQH9phekan-TPA/profile-displayphoto-shrink_800_800/0/1516471280363?e=2147483647&v=beta&t=bsQQeyfJLe0rY_zum3SU71JhcQJz0DlHNbvdg4p5r3g",
    "username": "_nicol",
    "text":
        "Clone Startups. Learn to code. 코딩은 진짜를 만들어보는거야! 실제 서비스를 따라 만들면서 코딩을 배우세요.",
    "images": [
      "https://media.istockphoto.com/id/1180279584/photo/aerial-people-crowd-on-pedestrian-crosswalk-top-view-background-toned-image.jpg?s=612x612&w=0&k=20&c=0Z7XMcUh4fbAv-OE6iVRS57aS4f8mK0VUMZrW5XSipk=",
      "https://i.imgur.com/NEOqA3F.jpg",
      "https://media.istockphoto.com/id/1146224410/photo/blurred-business-people-on-their-way-from-work.jpg?s=612x612&w=0&k=20&c=UFT3cwZt-tzx6uq3vlT-shHqNJSV9qi3S5IcxXUT3Ko=",
    ],
    "reply_images": [
      "https://media.istockphoto.com/id/1297159365/photo/portrait-of-young-smiling-woman-face-partially-covered-with-flying-hair-in-windy-day-standing.jpg?s=612x612&w=0&k=20&c=I16c_ZzQHEeGoPUVrVP9pPusSzsmymvVKdQVgPuVdDo=",
      "https://media.istockphoto.com/id/969233490/photo/young-african-woman-smiling-at-sunset.jpg?s=612x612&w=0&k=20&c=G0cagT6s1rXm455ZN8TCReO1C78ua1xGJPXDi6eKGLA=",
    ],
    "elapsed_time": "9m",
    "reply_count": 2,
    "like_count": 910
  },
];

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profile";
  static const String routeURL = "/profile";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onSettingPressed() {
    context.pushNamed(
      SettingsScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) => [
            SliverAppBar(
              backgroundColor:
                  isDarkMode(context) ? Colors.black : Colors.white,
              elevation: 0,
              leading: const Center(
                child: FaIcon(
                  FontAwesomeIcons.globe,
                ),
              ),
              actions: [
                const FaIcon(
                  FontAwesomeIcons.instagram,
                ),
                IconButton(
                  onPressed: _onSettingPressed,
                  icon: const FaIcon(
                    FontAwesomeIcons.barsStaggered,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),
                child: Column(
                  children: [
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Moz',
                              style: TextStyle(
                                fontSize: Sizes.size28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'moztiq',
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.h8,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size4,
                                    horizontal: Sizes.size12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDarkMode(context)
                                        ? Colors.grey.shade500
                                        : Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(
                                      Sizes.size12,
                                    ),
                                  ),
                                  child: Text(
                                    'threads.net',
                                    style: TextStyle(
                                      color: isDarkMode(context)
                                          ? Colors.black
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Gaps.v12,
                            const Text(
                              'Life is a journey',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.v12,
                            Row(
                              children: [
                                const SizedBox(
                                  width: 60,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: Sizes.size12,
                                        backgroundImage: NetworkImage(
                                          'https://media.istockphoto.com/id/1388913352/photo/lovely-business-man-attending-a-meeting-online-writing-stuff-down.jpg?s=612x612&w=0&k=20&c=xkrlDeFMcPOoelyiWd_FwuFOuGi23Fd-t18CxR15okE=',
                                        ),
                                      ),
                                      Positioned(
                                        right: Sizes.size20,
                                        child: CircleAvatar(
                                          radius: Sizes.size12,
                                          backgroundImage: NetworkImage(
                                            'https://media.istockphoto.com/id/1339296498/photo/beautiful-mid-adult-woman-walking-and-texting-message-on-mobile-phone-outside-business-center.jpg?s=612x612&w=0&k=20&c=YW6PQ28LuVnzqhJh-s3TA1SogZ8uotTBdDU1Mr1a2sY=',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '2 followers',
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: isDarkMode(context)
                                        ? Colors.grey.shade200
                                        : Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const CircleAvatar(
                          radius: Sizes.size32,
                          backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/12403584?v=4',
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(
                              Sizes.size10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Sizes.size10,
                              ),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gaps.h20,
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(
                              Sizes.size10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Sizes.size10,
                              ),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Share profile',
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: PersistentTabBar(),
              pinned: true,
              // pinned: true,
            ),
          ],
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Post(info: list[index]),
                    const Divider(
                      height: 0,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('No replies'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

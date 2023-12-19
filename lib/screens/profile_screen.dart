import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/settings_screen.dart';
import 'package:nc_flutter_threads/screens/widgets/persistent_tabbar.dart';
import 'package:nc_flutter_threads/screens/widgets/post.dart';
import 'package:nc_flutter_threads/utils.dart';

const list = [
  {
    "profile_pic_url":
        "https://images.khan.co.kr/article/2023/03/13/news-p.v1.20230313.6b9905f71fff49ff9aff42460b9047fd_P1.png",
    "username": "_epark",
    "text": "‘화이트 데이에 사탕을 선물하고 싶은 연예인’ 1위에 배우 박은빈과 아이돌 뉴진스가 꼽혔다. ",
    "images": [
      "https://offloadmedia.feverup.com/secretseoul.com/wp-content/uploads/2022/11/07212351/%EC%82%B0%ED%83%80-1024x683.jpg",
      "https://thumb.mt.co.kr/06/2023/11/2023111914060157118_1.jpg",
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202112/02/97a7340f-e449-40ef-9fcf-531216779e89.jpg",
    ],
    "reply_images": [
      "https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202303/13/sbsnoriter/20230313145738118regu.jpg",
      "https://file.sportsseoul.com/news/cms/2023/04/23/news-p.v1.20230423.f44884cc1fac4feaa9056fa9f4c8d44e_P1.jpg",
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
      "https://images.khan.co.kr/article/2023/03/13/news-p.v1.20230313.6b9905f71fff49ff9aff42460b9047fd_P1.png",
      "https://file.sportsseoul.com/news/cms/2023/04/23/news-p.v1.20230423.f44884cc1fac4feaa9056fa9f4c8d44e_P1.jpg",
      "https://img.hankyung.com/photo/202302/BF.32589426.1.jpg",
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
      "https://d1telmomo28umc.cloudfront.net/media/public/thumbnails/carrot-market.jpg",
      "https://i.imgur.com/NEOqA3F.jpg",
      "https://file.okky.kr/images/1664955580105.png",
    ],
    "reply_images": [
      "https://s3.orbi.kr/data/file/united2/7559d4b48ce54f7dba55d2006a53851d.png",
      "https://mblogthumb-phinf.pstatic.net/MjAxNzEyMTZfNTIg/MDAxNTEzMzk4OTI1NTY5.Adb0MbO3WwvlP51KiOgKWPcPyRUYh7pbP1L5Zrp45lIg.Emli51gG8JdC7p-ooJBiYvcRvaP-sNnffoHejVLqGkYg.JPEG.samusiltour/_MG_8261.JPG?type=w800",
    ],
    "elapsed_time": "9m",
    "reply_count": 2,
    "like_count": 910
  },
];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onSettingPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
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
                                          'https://i.pinimg.com/280x280_RS/c4/92/43/c49243b39355f3d6e7c5ae4608e375a3.jpg',
                                        ),
                                      ),
                                      Positioned(
                                        right: Sizes.size20,
                                        child: CircleAvatar(
                                          radius: Sizes.size12,
                                          backgroundImage: NetworkImage(
                                            'https://image.cine21.com/resize/cine21/still/2017/1218/10_39_22__5a371c4aaae6b[X252,310].jpg',
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

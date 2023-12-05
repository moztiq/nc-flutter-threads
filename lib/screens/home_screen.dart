import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/widgets/post.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gaps.v96,
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/threads.svg",
              semanticsLabel: 'threads logo',
              width: Sizes.size40,
            ),
          ),
          Gaps.v48,
          for (var item in list) Post(info: item),
          Gaps.v36,
        ],
      ),
    );
  }
}

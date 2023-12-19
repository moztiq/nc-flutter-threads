import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/utils.dart';

List<Map<String, dynamic>> userList = [
  {
    "id": "cmello510",
    "name": "Cheri Mello",
    "followers": "1.6K",
    "image":
        "https://media.istockphoto.com/id/1311977351/photo/focused-on-success-and-growth.jpg?s=612x612&w=0&k=20&c=ZC4825QyArXmHB_quCjr184x1xm_mEDKGq3-52KVh7w=",
    "isFollowed": false,
  },
  {
    "id": "matveevaangelin",
    "name": "Rada Yash",
    "followers": "532",
    "image":
        "https://media.istockphoto.com/id/1420486889/photo/candid-portrait-of-young-middle-eastern-digital-native.jpg?s=612x612&w=0&k=20&c=SV7ZhKg7qCeL6oYZGBaIxqfTTrQZu08kndvIKqdL_PI=",
    "isFollowed": false,
  },
  {
    "id": "axellevanmoerkerke",
    "name": "Xellie De Coolste",
    "followers": "6.1K",
    "image":
        "https://media.istockphoto.com/id/1432226243/photo/happy-young-woman-of-color-smiling-at-the-camera-in-a-studio.jpg?s=612x612&w=0&k=20&c=rk75Rl4PTtXbEyj7RgSz_pJPlgEpUEsgcJVNGQZbrMw=",
    "isFollowed": false,
  },
  {
    "id": "Janne",
    "name": "KnutselJanne",
    "followers": "6.1K",
    "image":
        "https://media.istockphoto.com/id/1388913352/photo/lovely-business-man-attending-a-meeting-online-writing-stuff-down.jpg?s=612x612&w=0&k=20&c=xkrlDeFMcPOoelyiWd_FwuFOuGi23Fd-t18CxR15okE=",
    "isFollowed": false,
  },
  {
    "id": "TheRealWhisperer",
    "name": "Maddie Lay",
    "followers": "423",
    "image":
        "https://media.istockphoto.com/id/1339296498/photo/beautiful-mid-adult-woman-walking-and-texting-message-on-mobile-phone-outside-business-center.jpg?s=612x612&w=0&k=20&c=YW6PQ28LuVnzqhJh-s3TA1SogZ8uotTBdDU1Mr1a2sY=",
    "isFollowed": false,
  },
  {
    "id": "haydens1829",
    "name": "Hayden Sloan",
    "followers": "12.1K",
    "image":
        "https://media.istockphoto.com/id/1319763415/photo/african-mid-woman-using-smartphone-at-home.jpg?s=612x612&w=0&k=20&c=vSYvylj1ykCwdIZ5ZHg0R2-NEzCXDkNjgBA2CPBVtDM=",
    "isFollowed": false,
  },
  {
    "id": "CartoonGeek8D",
    "name": "Cartoon Geek",
    "followers": "4K",
    "image":
        "https://media.istockphoto.com/id/1399395748/photo/cheerful-business-woman-with-glasses-posing-with-her-hands-under-her-face-showing-her-smile.jpg?s=612x612&w=0&k=20&c=EbnuxLE-RJP9a08h2zjfgKUSFqmjGubk0p6zwJHnbrI=",
    "isFollowed": false,
  },
  {
    "id": "Teddy_bear0001",
    "name": "Bucky Bear",
    "followers": "98K",
    "image":
        "https://media.istockphoto.com/id/1289220949/photo/successful-smiling-woman-wearing-eyeglasses-on-grey-wall.jpg?s=612x612&w=0&k=20&c=BjyPRn28F3mc6IiBCf4Ko-lFZisaNUYXBBnAcO47ZgE=",
    "isFollowed": false,
  },
];

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";
  static const String routeURL = "/search";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  List<Map<String, dynamic>> searchList = [];

  @override
  void initState() {
    super.initState();
    searchList = userList;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onSubmitted(String value) {
    setState(() {
      searchList = userList
          .where((element) =>
              element['id'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _onReset() {
    setState(() {
      _textEditingController.clear();
      searchList = userList;
    });
  }

  void _onToggleFollow(index) {
    if (searchList[index]['isFollowed'] != null) {
      setState(() {
        searchList[index]['isFollowed'] = !searchList[index]['isFollowed'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: Sizes.size32,
            fontWeight: FontWeight.bold,
            // letterSpacing: 0.1,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
            Sizes.size36,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size5,
              horizontal: Sizes.size16,
            ),
            child: CupertinoSearchTextField(
              autocorrect: false,
              controller: _textEditingController,
              onSubmitted: _onSubmitted,
              onSuffixTap: _onReset,
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: Sizes.size20,
                  backgroundImage: NetworkImage(
                    searchList[index]['image'],
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      searchList[index]['id'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.h10,
                    const FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: Sizes.size16,
                      color: Colors.blue,
                    ),
                  ],
                ),
                subtitle: Text(searchList[index]['name']),
                trailing: GestureDetector(
                  onTap: () => _onToggleFollow(index),
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
                    child: Text(
                      searchList[index]['isFollowed'] ? 'Unfollow' : 'Follow',
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Gaps.h72,
                Expanded(
                  child: Text(
                    '${searchList[index]['followers']} followers',
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
    );
  }
}

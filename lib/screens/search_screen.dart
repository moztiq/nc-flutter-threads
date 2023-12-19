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
        "https://i.pinimg.com/280x280_RS/c4/92/43/c49243b39355f3d6e7c5ae4608e375a3.jpg",
    "isFollowed": false,
  },
  {
    "id": "matveevaangelin",
    "name": "Rada Yash",
    "followers": "532",
    "image":
        "https://i.pinimg.com/280x280_RS/1b/ed/d6/1bedd61fca441a55809ed9fe5c268057.jpg",
    "isFollowed": false,
  },
  {
    "id": "axellevanmoerkerke",
    "name": "Xellie De Coolste",
    "followers": "6.1K",
    "image":
        "https://i.pinimg.com/280x280_RS/6f/ba/eb/6fbaeb9cbc9a2d1ad1aaa3d1dd7e51d8.jpg",
    "isFollowed": false,
  },
  {
    "id": "Janne",
    "name": "KnutselJanne",
    "followers": "6.1K",
    "image":
        "https://i.pinimg.com/280x280_RS/1c/48/4a/1c484ae2c8ad6ee037e6ff8fa8fa8d4b.jpg",
    "isFollowed": false,
  },
  {
    "id": "TheRealWhisperer",
    "name": "Maddie Lay",
    "followers": "423",
    "image":
        "https://i.pinimg.com/280x280_RS/37/47/e7/3747e7aee5dea96b12e4fb867c85ef89.jpg",
    "isFollowed": false,
  },
  {
    "id": "haydens1829",
    "name": "Hayden Sloan",
    "followers": "12.1K",
    "image":
        "https://i.pinimg.com/280x280_RS/29/54/ec/2954ec3f187d405bc7ba3e5849e6c77e.jpg",
    "isFollowed": false,
  },
  {
    "id": "CartoonGeek8D",
    "name": "Cartoon Geek",
    "followers": "4K",
    "image":
        "https://i.pinimg.com/280x280_RS/84/43/6e/84436e9ce714da620c052d08fefe66d6.jpg",
    "isFollowed": false,
  },
  {
    "id": "Teddy_bear0001",
    "name": "Bucky Bear",
    "followers": "98K",
    "image":
        "https://i.pinimg.com/280x280_RS/de/17/f2/de17f204820b9fedadb53da04dcbcb93.jpg",
    "isFollowed": false,
  },
];

class SearchScreen extends StatefulWidget {
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

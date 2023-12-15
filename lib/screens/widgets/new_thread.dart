import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/photo_screen.dart';

class NewThread extends StatefulWidget {
  const NewThread({super.key});

  @override
  State<NewThread> createState() => _NewThreadState();
}

class _NewThreadState extends State<NewThread> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String text = '';
  List<String> _photoList = [];

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        text = _textEditingController.text;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onClosedPressed() {
    Navigator.of(context).pop();
  }

  void _onAttachPhoto() async {
    var result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PhotoScreen(),
      ),
    );
    _photoList = result;
    setState(() {});
  }

  void _onRemovePhoto(int index) {
    _photoList.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: Sizes.size64,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                Sizes.size1,
              ),
              child: Container(
                color: Colors.grey.shade200,
                height: Sizes.size1,
              ),
            ),
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'New thread',
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.xmark,
                size: Sizes.size20,
              ),
              onPressed: _onClosedPressed,
            )
            // GestureDetect
            ),
        body: Padding(
          padding: EdgeInsets.only(
            left: Sizes.size14,
            right: Sizes.size14,
            top: Sizes.size14,
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: Sizes.size36,
                        child: CircleAvatar(
                          radius: Sizes.size18,
                          foregroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/12403584',
                            scale: 1.5,
                          ),
                        ),
                      ),
                      Gaps.v10,
                      Container(
                        color: Colors.grey.shade300,
                        width: Sizes.size1,
                        height: Sizes.size72,
                      ),
                      Gaps.v10,
                      SizedBox(
                        width: Sizes.size20,
                        child: CircleAvatar(
                          radius: Sizes.size18,
                          foregroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/12403584',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.h20,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'moztiq', // Replace with the actual username
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        TextField(
                          // expands: true,
                          minLines: null,
                          maxLines: null,
                          focusNode: _focusNode,
                          textInputAction: TextInputAction.newline,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Start a thread...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: Sizes.size18,
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                        Gaps.v20,
                        _photoList.isEmpty
                            ? GestureDetector(
                                onTap: _onAttachPhoto,
                                child: FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color: Colors.grey.shade500,
                                ),
                              )
                            : Column(
                                children: [
                                  ListView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      for (var entry
                                          in _photoList.asMap().entries)
                                        Stack(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: Sizes.size4,
                                              ),
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Sizes.size10,
                                                ),
                                              ),
                                              child:
                                                  Image.file(File(entry.value)),
                                            ),
                                            Positioned(
                                              top: Sizes.size10,
                                              right: Sizes.size10,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    _onRemovePhoto(entry.key),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCircleXmark,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                    ],
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                height: Sizes.size52,
                width: MediaQuery.of(context).size.width - Sizes.size28,
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Anyone can reply',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: text.length > 0 ? 1 : 0.5,
                        duration: Duration(milliseconds: 200),
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

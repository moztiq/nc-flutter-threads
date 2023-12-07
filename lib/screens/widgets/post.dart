import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/widgets/post_menu.dart';

class Post extends StatefulWidget {
  final Map<String, dynamic> info;

  const Post({super.key, required this.info});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  void _onMenuPressed() {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.45,
      elevation: 0,
      backgroundColor: Colors.white,
      showDragHandle: true,
      context: context,
      builder: (context) => PostMenu(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.size12,
        vertical: Sizes.size20,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Gaps.v2,
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipOval(
                        child: Image.network(
                          widget.info['profile_pic_url'],
                          width: Sizes.size48,
                          height: Sizes.size48,
                          fit: BoxFit.cover,
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
                          child: const Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: Sizes.size14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Gaps.v10,
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size1,
                    ),
                    width: Sizes.size1,
                    color: Colors.black.withOpacity(0.2),
                    // height: double.infinity,
                    height: widget.info['images'] != null ? 250 : 70,
                  )
                ],
              ),
              Gaps.h16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.info['username'],
                        style: const TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.h5,
                      const FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        size: Sizes.size14,
                        color: Color(0xff2196f5),
                      ),
                      const SizedBox(
                        width: Sizes.size96 + Sizes.size72,
                      ),
                      Text(
                        widget.info['elapsed_time'],
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.h20,
                      IconButton(
                        onPressed: _onMenuPressed,
                        icon: FaIcon(
                          FontAwesomeIcons.ellipsis,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v5,
                  SizedBox(
                    width: Sizes.size96 +
                        Sizes.size96 +
                        Sizes.size96 +
                        Sizes.size10,
                    child: Text(
                      widget.info['text'],
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                  Gaps.v10,
                  Container(
                    child: widget.info['images'] != null
                        ? ConstrainedBox(
                            constraints: const BoxConstraints.expand(
                              width: 340,
                              height: 160,
                            ),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                width: 200,
                                height: 150,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size5,
                                  ),
                                ),
                                child: Image.network(
                                  widget.info['images'][index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              separatorBuilder: (context, index) => Gaps.h10,
                              itemCount: widget.info['images'].length,
                            ),
                          )
                        : null,
                  ),
                  Gaps.v20,
                  const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.black87,
                      ),
                      Gaps.h24,
                      FaIcon(
                        FontAwesomeIcons.comment,
                        color: Colors.black87,
                      ),
                      Gaps.h24,
                      FaIcon(
                        FontAwesomeIcons.arrowsRotate,
                        color: Colors.black87,
                      ),
                      Gaps.h24,
                      FaIcon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.black87,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Gaps.v10,
          Row(
            children: [
              Column(
                children: [
                  Gaps.v2,
                  SizedBox(
                    width: Sizes.size48,
                    height: Sizes.size48,
                    child: widget.info['reply_images'].length >= 3
                        ? Stack(
                            children: [
                              Positioned(
                                right: 0,
                                top: 0,
                                child: ClipOval(
                                  child: Image.network(
                                    widget.info['reply_images'][0],
                                    width: Sizes.size24,
                                    height: Sizes.size24,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 2,
                                top: 10,
                                child: ClipOval(
                                  child: Image.network(
                                    widget.info['reply_images'][1],
                                    width: Sizes.size18,
                                    height: Sizes.size18,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                bottom: 5,
                                child: ClipOval(
                                  child: Image.network(
                                    widget.info['reply_images'][2],
                                    width: Sizes.size14,
                                    height: Sizes.size14,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              Positioned(
                                left: 2,
                                top: 10,
                                child: ClipOval(
                                  child: Image.network(
                                    widget.info['reply_images'][0],
                                    width: Sizes.size24,
                                    height: Sizes.size24,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: Sizes.size4,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      widget.info['reply_images'][1],
                                      width: Sizes.size24,
                                      height: Sizes.size24,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
              Gaps.h16,
              Text(
                '${widget.info['reply_count']} replies · ${widget.info['like_count']} likes',
                style: TextStyle(
                  color: Colors.black.withOpacity(
                    0.5,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

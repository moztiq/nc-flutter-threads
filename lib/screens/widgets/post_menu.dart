import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/widgets/report_modal.dart';

class PostMenu extends StatefulWidget {
  const PostMenu({super.key});

  @override
  State<PostMenu> createState() => _PostMenuState();
}

class _PostMenuState extends State<PostMenu> {
  void _onReportTap() {
    Navigator.of(context).pop();
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.75,
      elevation: 0,
      backgroundColor: Colors.white,
      showDragHandle: true,
      context: context,
      builder: (context) => ReportModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  Sizes.size20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      Sizes.size18,
                    ),
                    topRight: Radius.circular(
                      Sizes.size18,
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Unfollow',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                color: Colors.grey.shade300,
              ),
              Container(
                padding: const EdgeInsets.all(
                  Sizes.size20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      Sizes.size18,
                    ),
                    bottomRight: Radius.circular(
                      Sizes.size18,
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Mute',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v20,
              Container(
                padding: const EdgeInsets.all(
                  Sizes.size20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      Sizes.size18,
                    ),
                    topRight: Radius.circular(
                      Sizes.size18,
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Hide',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                color: Colors.grey.shade300,
              ),
              GestureDetector(
                onTap: _onReportTap,
                child: Container(
                  padding: const EdgeInsets.all(
                    Sizes.size20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        Sizes.size18,
                      ),
                      bottomRight: Radius.circular(
                        Sizes.size18,
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

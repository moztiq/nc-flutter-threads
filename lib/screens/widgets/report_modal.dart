import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/main.dart';

class ReportModal extends StatefulWidget {
  const ReportModal({super.key});

  @override
  State<ReportModal> createState() => _ReportModalState();
}

const reportList = [
  "I just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nutidy or sexual activity",
  "Sale of illegal or regulated goods",
  "Bullying or harassment",
  "Suicide or self-injury",
  "Eating disorders",
  "Scam or fraud",
];

class _ReportModalState extends State<ReportModal> {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size20,
                ),
              ),
            ),
            Gaps.v12,
            Divider(
              height: 0,
              color: Colors.grey.shade300,
            ),
            Gaps.v12,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Text(
                'Why are you reporting this thread?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size18,
                ),
              ),
            ),
            Gaps.v5,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Text(
                "Your report is anomymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ),
            Gaps.v20,
            Divider(
              height: 0,
              color: Colors.grey.shade300,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: reportList.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size8,
                  ),
                  title: Text(
                    reportList[index],
                    style: const TextStyle(
                      fontSize: Sizes.size20,
                      letterSpacing: 0.1,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: Sizes.size28,
                    color: Colors.grey.shade400,
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 0,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

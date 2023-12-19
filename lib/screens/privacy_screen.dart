import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/utils.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivate = false;

  void _onPrivateChanged(bool? value) {
    if (value == null) return;
    setState(() {
      _isPrivate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        elevation: 0,
        title: const Text(
          'Privacy',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.shieldHalved,
            ),
            title: const Text(
              'Private profile',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: CupertinoSwitch(
              activeColor: isDarkMode(context) ? Colors.white : Colors.black,
              value: _isPrivate,
              onChanged: _onPrivateChanged,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.at,
            ),
            title: const Text(
              'Mentions',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Everyone',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade600,
                  ),
                ),
                Gaps.h16,
                const FaIcon(
                  CupertinoIcons.chevron_right,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bellSlash,
              size: Sizes.size20,
            ),
            title: Text(
              'Muted',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: FaIcon(
              CupertinoIcons.chevron_right,
              size: Sizes.size20,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.eyeSlash,
              size: Sizes.size20,
            ),
            title: Text(
              'Hidden Words',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: FaIcon(
              CupertinoIcons.chevron_right,
              size: Sizes.size20,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userGroup,
              size: Sizes.size20,
            ),
            title: Text(
              'Profiles you follow',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: FaIcon(
              CupertinoIcons.chevron_right,
              size: Sizes.size20,
            ),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text(
              'Other privacy settings',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Some settings, like restrict, apply to both Threads and Instgram and can be managed on Instagram.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: Sizes.size16,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleXmark,
              size: Sizes.size24,
            ),
            title: Text(
              'Blocked profiles',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.heartCrack,
              size: Sizes.size24,
            ),
            title: Text(
              'Hide likes',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
            ),
          ),
        ],
      ),
    );
  }
}

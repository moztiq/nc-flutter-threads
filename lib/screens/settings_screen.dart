import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userPlus,
            ),
            title: Text(
              'Follow and invite friedns',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bell,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.shieldHalved),
            title: Text(
              'Privacy',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PrivacyScreen(),
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleUser),
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleQuestion),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleInfo),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            title: Text(
              'Log out',
              style: TextStyle(
                color: Colors.blue,
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text("Are you sure?"),
                content: Text('See you later!'),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('No'),
                  ),
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDestructiveAction: true,
                    child: const Text('Yes'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

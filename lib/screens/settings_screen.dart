import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/privacy_screen.dart';
import 'package:nc_flutter_threads/utils.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "settings";
  static const String routeURL = "/settings";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userPlus,
            ),
            title: Text(
              'Follow and invite friends',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const ListTile(
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
            leading: const FaIcon(FontAwesomeIcons.shieldHalved),
            title: const Text(
              'Privacy',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => context.pushNamed(PrivacyScreen.routeName),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.circleUser),
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.circleQuestion),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.circleInfo),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text(
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
                title: const Text("Are you sure?"),
                content: const Text('See you later!'),
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

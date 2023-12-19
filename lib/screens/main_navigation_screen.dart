import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/activity_screen.dart';
import 'package:nc_flutter_threads/screens/home_screen.dart';
import 'package:nc_flutter_threads/screens/profile_screen.dart';
import 'package:nc_flutter_threads/screens/search_screen.dart';
import 'package:nc_flutter_threads/screens/settings_screen.dart';
import 'package:nc_flutter_threads/screens/widgets/new_thread.dart';
import 'package:nc_flutter_threads/utils.dart';

import 'widgets/nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  List<String> _tabs = [
    "home",
    "search",
    "xxx",
    "activity",
    "profile",
    "settings"
  ];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  bool _isNewThreadTap = false;

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNewThreadTapUp(TapUpDetails details) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.9,
      elevation: 0,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => NewThread(),
    );
    setState(() {
      _isNewThreadTap = false;
    });
  }

  void _onNewThreadTapDown(TapDownDetails details) {
    setState(() {
      _isNewThreadTap = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 5,
            child: const SettingsScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: isDarkMode(context) ? Colors.black : Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBar(
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavBar(
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            GestureDetector(
              onTapDown: _onNewThreadTapDown,
              onTapUp: _onNewThreadTapUp,
              child: AnimatedOpacity(
                opacity: _isNewThreadTap ? 1 : 0.4,
                duration: Duration(milliseconds: 200),
                child: FaIcon(
                  FontAwesomeIcons.penToSquare,
                  size: Sizes.size28,
                ),
              ),
            ),
            NavBar(
              icon: FontAwesomeIcons.heart,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavBar(
              icon: FontAwesomeIcons.user,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}

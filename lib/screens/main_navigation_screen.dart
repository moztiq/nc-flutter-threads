import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/screens/activity_screen.dart';
import 'package:nc_flutter_threads/screens/home_screen.dart';
import 'package:nc_flutter_threads/screens/profile_screen.dart';
import 'package:nc_flutter_threads/screens/search_screen.dart';
import 'package:nc_flutter_threads/screens/widgets/new_thread.dart';

import 'widgets/nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  bool _isNewThreadTap = false;

  void _onTap(int index) {
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
      backgroundColor: Colors.white,
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
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
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

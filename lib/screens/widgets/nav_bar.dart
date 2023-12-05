import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';

class NavBar extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const NavBar({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 200,
        ),
        opacity: isSelected ? 1 : 0.4,
        child: FaIcon(
          icon,
          size: Sizes.size28,
        ),
      ),
    );
  }
}

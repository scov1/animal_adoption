import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../gen/assets.gen.dart';
import 'nav_bar_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.current,
    required this.switchTo,
  });

  final void Function(int) switchTo;
  final int current;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 8,
      currentIndex: widget.current,
      onTap: (index) async {
        widget.switchTo(index);
      },
      selectedItemColor: context.color.shadow,
      unselectedItemColor: context.color.grey300,
      backgroundColor: context.color.background,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      enableFeedback: true,
      selectedFontSize: 4,
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            isActive: widget.current == 0,
            activeIconPath: Assets.svg.icHome,
            inactiveIconPath: Assets.svg.icHome,
            label: '',
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            isActive: widget.current == 1,
            activeIconPath: Assets.svg.icPaw,
            inactiveIconPath: Assets.svg.icPaw,
            label: '',
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            isActive: widget.current == 2,
            activeIconPath: Assets.svg.icFavorite,
            inactiveIconPath: Assets.svg.icFavorite,
            label: '',
          ),
        ),
      ],
    );
  }
}

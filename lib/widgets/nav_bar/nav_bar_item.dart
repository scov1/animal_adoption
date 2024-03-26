import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.isActive,
    required this.label,
    required this.activeIconPath,
    required this.inactiveIconPath,
  });

  final String activeIconPath;
  final String inactiveIconPath;
  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  isActive ? activeIconPath : inactiveIconPath,
                  colorFilter: isActive
                      ? ColorFilter.mode(context.color.shadow, BlendMode.srcIn)
                      : ColorFilter.mode(context.color.grey300, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

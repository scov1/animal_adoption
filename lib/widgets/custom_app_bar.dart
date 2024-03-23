import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/theme/app_theme.dart';
import 'leading_buttons/arrow_leading_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.actions,
    this.bottom,
    this.canPop = true,
    this.height = kToolbarHeight,
    this.leading,
    this.padding = 16.0,
    this.title,
    this.titleChild,
    this.backgroundColor,
    this.centerTitle = true,
    this.systemOverlayStyle,
  }) : super(key: key);

  final List<Widget>? actions;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool canPop;
  final bool centerTitle;
  final double height;
  final Widget? leading;
  final double padding;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final String? title;
  final Widget? titleChild;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Widget? title = titleChild;
    if (title == null) {
      if (this.title == null) {
        title = const SizedBox.shrink();
      } else {
        title = Text(
          this.title!,
          style: context.text.h16w700,
        );
      }
    }
    Widget? leading;
    if (canPop) {
      leading = this.leading;
      leading ??= const ArrowLeadingButton();
    }

    return AppBar(
      centerTitle: centerTitle,
      titleSpacing: 0.0,
      toolbarHeight: height,
      backgroundColor: backgroundColor ?? context.color.background,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: leading,
      title: title,
      bottom: bottom,
      actions: actions,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF8FAFB),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

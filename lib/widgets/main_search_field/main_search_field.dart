import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';
import '../../gen/assets.gen.dart';

///Text field for searching
class MainSearchField extends StatefulWidget {
  const MainSearchField({
    super.key,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.cursorColor,
  });

  ///Callback that works when value changes
  final Function(String)? onChanged;

  ///Color of cursor
  final Color? cursorColor;

  ///Focus node for controlling focus
  final FocusNode? focusNode;

  ///Placeholder for field with empty value
  final String? hintText;

  @override
  State<MainSearchField> createState() => _MainSearchFieldState();
}

class _MainSearchFieldState extends State<MainSearchField> {
  late TextEditingController controller;
  IconButton? suffixIcon;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(_getSuffixIcon);
    super.initState();
  }

  void _getSuffixIcon() {
    setState(() {
      suffixIcon = controller.text.isEmpty
          ? null
          : IconButton(
              iconSize: 11,
              padding: EdgeInsets.zero,
              onPressed: () {
                controller.clear();
                widget.onChanged?.call('');
              },
              icon: Icon(Icons.close),
            );
    });
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        cursorColor: widget.cursorColor,
        controller: controller,
        focusNode: widget.focusNode,
        style: context.text.s16w600.copyWith(
          color: context.color.shadow,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: context.color.grey100,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          hintStyle: context.text.s14w400.copyWith(
            color: context.color.grey700,
            height: 1,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 16,
              right: 8,
            ),
            child: SvgPicture.asset(
              Assets.svg.icSearch,
            ),
          ),
          suffixIcon: suffixIcon,
          border: _buildBorder(),
          focusedBorder: _buildBorder(),
          errorBorder: _buildBorder(),
          enabledBorder: _buildBorder(),
          disabledBorder: _buildBorder(),
          focusedErrorBorder: _buildBorder(),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}

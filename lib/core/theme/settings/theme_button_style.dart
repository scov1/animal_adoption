import 'package:flutter/material.dart';

import 'theme_colors.dart';
import 'theme_text_style.dart';

class ThemeButtonStyles {
  ThemeButtonStyles(this._color, this._style);

  final ThemeColors _color;
  final ThemeTextStyles _style;

  late final ButtonStyle disabled = ElevatedButton.styleFrom(
    textStyle: _style.h16w700.copyWith(color: _color.grey700),
    foregroundColor: _color.grey300,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    backgroundColor: _color.grey300,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 35.0,
    ),
  );

  late final ButtonStyle elevated1 = ElevatedButton.styleFrom(
    textStyle: _style.h16w700,
    foregroundColor: _color.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(60.0),
    ),
    backgroundColor: _color.accentBg,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 14.0,
      horizontal: 32.0,
    ),
  );

  late final ButtonStyle elevated2 = ElevatedButton.styleFrom(
    foregroundColor: _color.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    backgroundColor: _color.accentBg,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 12.0,
      horizontal: 24.0,
    ),
  );

  late final ButtonStyle elevated3 = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: _color.background,
  );

  late final ButtonStyle outline1 = OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: _color.textPrimary,
    elevation: 0.0,
    side: BorderSide(color: _color.textPrimary),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 24.0,
    ),
    textStyle: _style.s16w600,
  );

  late final ButtonStyle text1 = ElevatedButton.styleFrom(
    foregroundColor: _color.accent,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    textStyle: _style.s16w600,
  );

  late final ButtonStyle text2 = ElevatedButton.styleFrom(
    foregroundColor: _color.textPrimary,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    textStyle: _style.s16w600,
  );

  late final ButtonStyle text3 = ElevatedButton.styleFrom(
    textStyle: _style.h16w700.copyWith(color: _color.accent),
    foregroundColor: _color.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: _color.background,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 32.0,
    ),
  );

  late final ButtonStyle text4 = TextButton.styleFrom(
    textStyle: _style.h16w700,
    foregroundColor: _color.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: _color.accentBg,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 32.0,
    ),
  );

  // final ITextStyles _style;

  // @override
  // ThemeExtension<IButtonStyles> copyWith() {
  //   return this;
  // }

  // @override
  // IButtonStyles lerp(ThemeExtension<IButtonStyles>? other, double t) {
  //   return this;
  // }

  // @override
  // Object get type => IButtonStyles;
}

import 'package:flutter/material.dart';

import 'theme_colors.dart';

class ThemeTextStyles {
  ThemeTextStyles(this._colors);

  late ThemeColors _colors;

  late final TextStyle error = TextStyle(
    fontSize: 14,
    color: _colors.error,
    fontFamily: 'Comfortaa',
  );

  late final h16w700 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w700,
  );

  late final h20w700 = TextStyle(
    fontSize: 20,
    color: _colors.textPrimary,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w700,
  );

  late final h24w700 = TextStyle(
    fontSize: 24,
    color: _colors.textPrimary,
    // fontFamily: 'Comfortaa',
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w700,
  );

  late final s10w500 = TextStyle(
    fontSize: 10,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  late final s12w400 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );

  late final s12w700 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  late final s14w400 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );

  late final s14w700 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  late final s16w400 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  late final s16w600 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  late final s16w700 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  late final s22w700 = TextStyle(
    fontSize: 22,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Comfortaa',
  );

  late final s20w700 = TextStyle(
    fontSize: 20,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  late final s24w700 = TextStyle(
    fontSize: 24,
    color: _colors.textPrimary,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w700,
  );

  late final s36w400 = TextStyle(
    fontSize: 36,
    color: _colors.textPrimary,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w400,
  );

  late final s30w400 = TextStyle(
    fontSize: 30,
    color: _colors.textPrimary,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w400,
  );

  late final s32w700 = TextStyle(
    fontSize: 32,
    color: _colors.textPrimary,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w700,
  );

  late final h26w700 = TextStyle(
    fontSize: 26,
    color: _colors.background,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w700,
  );

  TextStyle get s30w700 => TextStyle(
        fontSize: 30,
        color: _colors.background,
        fontFamily: 'Comfortaa',
        fontWeight: FontWeight.w700,
      );

  TextStyle get s30w900 => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w900,
        color: _colors.accentBg,
        letterSpacing: 1.5,
        fontFamily: 'Comfortaa',
        shadows: [
          Shadow(
            color: _colors.accentBg.withOpacity(0.4),
            offset: Offset(2, 2),
            blurRadius: 3,
          ),
        ],
      );
}

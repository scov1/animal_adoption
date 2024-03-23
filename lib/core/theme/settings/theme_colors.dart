import 'package:flutter/material.dart';

class ThemeColors {
  const ThemeColors({
    this.background = const Color(0xFFF8FAFB),
    this.textPrimary = const Color(0xFF212429),
    this.error = const Color(0xFFED5A3A),
    this.errorBg = const Color(0xFFFDEBE7),
    this.success = const Color(0xFF49B66E),
    this.successBg = const Color(0xFFE8F7EB),
    this.grey900 = const Color(0xFF6B7280),
    this.grey700 = const Color(0xFF949EA4),
    this.grey300 = const Color(0xFFE8E8E8),
    this.grey100 = const Color(0xFFF4F4F5),
    this.link = const Color(0xFF3E66CE),
    // this.accent = const Color(0xFF3959F9),
    this.accent = const Color(0xFF7A70B9),
    this.accentBg = const Color(0xFF7A70B9),
    this.shadow = const Color(0xff000000),
    this.greyTextColor = const Color(0xff949EA4),
    this.blueButtonColor = const Color(0xff3959F9),
    //this.accentBg = const Color.fromRGBO(255, 140, 28, 0.12),
    this.starColor = const Color(0xFFEA8928),
    this.chipGreyColor = const Color(0xFFEAEAEA),
    this.rateButtonColor = const Color(0xFF33393F),
  });

  final Color accent;
  final Color accentBg;
  final Color background;
  final Color error;
  final Color errorBg;
  final Color grey100;
  final Color grey300;
  final Color grey700;
  final Color grey900;
  final Color link;
  final Color shadow;
  final Color success;
  final Color successBg;
  final Color textPrimary;
  final Color greyTextColor;
  final Color blueButtonColor;
  final Color starColor;
  final Color chipGreyColor;
  final Color rateButtonColor;

  ThemeColors copyWith({
    Color? accent,
    Color? accentBg,
    Color? background,
    Color? shadow,
    Color? error,
    Color? errorBg,
    Color? grey100,
    Color? grey300,
    Color? grey700,
    Color? grey900,
    Color? link,
    Color? success,
    Color? successBg,
    Color? textPrimary,
  }) {
    return ThemeColors(
      accent: accent ?? this.accent,
      accentBg: accentBg ?? this.accentBg,
      background: background ?? this.background,
      shadow: shadow ?? this.shadow,
      error: error ?? this.error,
      errorBg: errorBg ?? this.errorBg,
      grey100: grey100 ?? this.grey100,
      grey300: grey300 ?? this.grey300,
      grey700: grey700 ?? this.grey700,
      grey900: grey900 ?? this.grey900,
      link: link ?? this.link,
      success: success ?? this.success,
      successBg: successBg ?? this.successBg,
      textPrimary: textPrimary ?? this.textPrimary,
    );
  }
}

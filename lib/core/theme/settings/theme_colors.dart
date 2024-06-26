import 'package:flutter/material.dart';

class ThemeColors {
  const ThemeColors({
    this.background = const Color(0xFFF8FAFB),
    this.textPrimary = const Color(0xFF212429),
    this.error = const Color(0xFFED5A3A),
    this.errorBg = const Color(0xFFFDEBE7),
    this.success = const Color(0xFF49B66E),
    this.successBg = const Color(0xFFE8F7EB),
    this.grey700 = const Color(0xFF949EA4),
    this.grey300 = const Color(0xFFE8E8E8),
    this.grey100 = const Color(0xFFF4F4F5),
    this.accent = const Color(0xFFe6e6fa),
    this.accentBg = const Color(0xFF7A70B9),
    this.shadow = const Color(0xff000000),
    this.greyTextColor = const Color(0xff949EA4),
    this.purpleBg = const Color(0xFF827397),
    this.paleMint = const Color(0xFFE4F3F4),
    this.mint = const Color(0xFFC5EEF0),
    this.orangeText = const Color(0xFFEFA02A),
    this.lavanderBg = const Color(0xFFcdc6ff),
  });

  final Color accent;
  final Color accentBg;
  final Color background;
  final Color error;
  final Color errorBg;
  final Color grey100;
  final Color grey300;
  final Color grey700;
  final Color shadow;
  final Color success;
  final Color successBg;
  final Color textPrimary;
  final Color greyTextColor;
  final Color purpleBg;
  final Color paleMint;
  final Color mint;
  final Color orangeText;
  final Color lavanderBg;

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
    Color? success,
    Color? successBg,
    Color? textPrimary,
    Color? purpleBg,
    Color? paleMint,
    Color? mint,
    Color? orangeText,
    Color? lavanderBg,
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
      success: success ?? this.success,
      successBg: successBg ?? this.successBg,
      textPrimary: textPrimary ?? this.textPrimary,
      purpleBg: purpleBg ?? this.purpleBg,
      paleMint: paleMint ?? this.paleMint,
      mint: mint ?? this.mint,
      orangeText: orangeText ?? this.orangeText,
      lavanderBg: lavanderBg ?? this.lavanderBg,
    );
  }
}

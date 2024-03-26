import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class AppProgressIndicator extends StatefulWidget {
  const AppProgressIndicator({
    super.key,
    this.margin,
    this.widthFactor = 0.13,
    this.theme,
  }) : dark = false;

  const AppProgressIndicator.dark({
    super.key,
    this.margin,
    this.widthFactor = 0.13,
    this.theme,
  }) : dark = true;

  final bool dark;
  final EdgeInsetsGeometry? margin;
  final ThemeData? theme;
  final double widthFactor;

  @override
  State<AppProgressIndicator> createState() => _AppProgressIndicatorState();
}

class _AppProgressIndicatorState extends State<AppProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  )..repeat();

  late ThemeData theme;

  @override
  void didChangeDependencies() {
    theme = widget.theme ?? context.theme;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Color get color => widget.dark ? theme.color.textPrimary : theme.color.background;

  Color get shadowColor =>
      widget.dark ? Colors.white.withOpacity(0.25) : Colors.black.withOpacity(0.25);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Builder(
        builder: (context) {
          return Center(
            child: FractionallySizedBox(
              widthFactor: widget.widthFactor,
              child: Container(
                margin: widget.margin,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 16,
                      spreadRadius: 3,
                      offset: const Offset(0, 5),
                      color: shadowColor,
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final size = constraints.maxWidth;
                    return Stack(
                      children: [
                        SizedBox(
                          height: size,
                          child: RotationTransition(
                            turns: CurvedAnimation(
                              parent: controller,
                              curve: Curves.decelerate,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: SweepGradient(
                                  colors: [
                                    context.color.accent,
                                    color,
                                    context.color.accent,
                                  ],
                                  stops: const [0, 0.54, 0],
                                ),
                              ),
                              padding: EdgeInsets.all(size * 0.15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(size * 0.08),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

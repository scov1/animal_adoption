import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../data/model/articles.dart';

class DetailsArticle extends StatefulWidget {
  DetailsArticle({Key? key, required this.article}) : super(key: key);

  final ArticlesDto article;

  @override
  _DetailsArticleState createState() => _DetailsArticleState();
}

class _DetailsArticleState extends State<DetailsArticle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final double _circleRadius = 100.0;
  final double _startAngle = -pi / 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).articles,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                Formatters.customFormatDate(widget.article.createdAt),
                style: context.text.s14w400,
              ),
            ),
            const SizedBox(height: 16),
            Text(widget.article.title, style: context.text.h16w700),
            const SizedBox(height: 16),
            Text(widget.article.desc, style: context.text.s14w400),
            const SizedBox(height: 16),
            SvgPicture.asset(
              widget.article.image,
              height: 220,
            ),
            const SizedBox(height: 16),
            Text(widget.article.message, style: context.text.s14w400),
            widget.article.basket?.isNotEmpty == true
                ? Expanded(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: widget.article.basket!.map((item) {
                            int index = widget.article.basket!.indexOf(item);
                            double angle =
                                _startAngle + (index / widget.article.basket!.length) * (2 * pi);
                            double x = cos(angle) * _circleRadius * _animation.value;
                            double y = sin(angle) * _circleRadius * _animation.value;

                            return Transform.translate(
                              offset: Offset(x, y),
                              child: Opacity(
                                opacity: _animation.value,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: context.color.paleMint,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: InkWell(
                                      onTap: () {
                                        _showSnackBar(item.title);
                                      },
                                      child: Image.asset(
                                        item.image,
                                        height: 24,
                                      ),
                                    )),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

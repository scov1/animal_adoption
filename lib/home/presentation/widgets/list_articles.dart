import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/navigator/navigator1_helper.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/generated/l10n.dart';
import '../../domain/vo/articles.dart';
import 'details_article.dart';

class ListArticles extends StatefulWidget {
  ListArticles({Key? key}) : super(key: key);

  @override
  _ListArticlesState createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  List<ArticlesVo> articles = ArticlesData.articles;

  @override
  Widget build(BuildContext context) {
    List<Color> bgColors = [
      context.color.lavanderBg.withOpacity(0.4),
      context.color.paleMint,
      context.color.grey300.withOpacity(0.5)
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          S.of(context).articles,
          style: context.text.s20w500,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 24),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.router.use.push(DetailsArticle(
                  article: articles[index],
                ));
              },
              child: Container(
                height: 180,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: bgColors[index],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, top: 24, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articles[index].title,
                              style: context.text.h16w700,
                              maxLines: 2,
                            ),
                            SizedBox(height: 8),
                            Text(
                              articles[index].desc,
                              style: context.text.s14w400,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        articles[index].image,
                        fit: BoxFit.contain,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: articles.length,
        ),
      ],
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import 'dto/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingDto> onboardingItems = OnboardingData.items;
  final _controller = CarouselController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        canPop: false,
      ),
      body: SafeArea(
        top: true,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            CarouselSlider(
              carouselController: _controller,
              items: onboardingItems
                  .map(
                    (e) => SvgPicture.asset(e.image!),
                  )
                  .toList(),
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 1.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (i, _) {
                    setState(() {
                      current = i;
                    });
                  }),
            ),
            const SizedBox(height: 16.0),
            Text(
              onboardingItems[current].title ?? '',
              style: context.text.s12w700.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              onboardingItems[current].desc ?? '',
              style: context.text.s14w400.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: onboardingItems.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : context.color.accentBg)
                          .withOpacity(
                        current == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: context.button.elevated1,
                    onPressed: () {
                      if (current == onboardingItems.length - 1) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        _controller.nextPage();
                      }
                    },
                    child: Text(
                      current == onboardingItems.length - 1
                          ? S.of(context).start
                          : S.of(context).next,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

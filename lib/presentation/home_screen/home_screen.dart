import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';
import '../../gen/assets.gen.dart';
import '../../l10n/generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/banner.dart';
import 'widgets/grid_pets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        canPop: false,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        children: [
          HomeBanner(),
          GridPets(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/init/core_di.dart';
import '../../widgets/custom_app_bar.dart';
import 'data/bloc/bloc.dart';
import 'widgets/banner.dart';
import 'widgets/grid_pets.dart';
import 'widgets/list_articles.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          CoreDi.getIt<HomeBloc>().add(DataHomeEvent());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                HomeBanner(),
                GridPets(),
                ListArticles(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

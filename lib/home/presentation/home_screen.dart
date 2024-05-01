import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/error_handler/error_handler.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../root/controller/primary_tab_controller.dart';
import '../domain/entity/home_entity.dart';
import 'widgets/banner.dart';
import 'widgets/home_grid_pets.dart';
import 'widgets/list_articles.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeEntity>(context).add(DataHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        canPop: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<HomeEntity>(context).add(DataHomeEvent());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                HomeBanner(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).adoptPets,
                          style: context.text.s20w500,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<PrimaryTabsController>().switchToTab(1);
                          },
                          child: Text(
                            S.of(context).showAll,
                            style: context.text.s16w400,
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<HomeEntity, HomeState>(
                      bloc: BlocProvider.of<HomeEntity>(context),
                      builder: (context, state) {
                        if (state is LoadingHomeState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is ErrorHomeState) {
                          return AppErrorWidget(
                            message: context.read<ErrorHandler>().handleError(state),
                            onRefresh: () {
                              BlocProvider.of<HomeEntity>(context).add(DataHomeEvent());
                            },
                          );
                        }
                        if (state is DataHomeState) {
                          return HomeGridPets(
                            pets: state.pets,
                          );
                        }

                        return SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                ListArticles(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

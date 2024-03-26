import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/init/core_di.dart';
import '../../core/navigator/navigator1_helper.dart';
import '../../widgets/loader_overlay/app_loader_stack.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../home_screen/home_screen.dart';
import 'controller/primary_tab_controller.dart';
import 'controller/states.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({this.deeplinkBookId, super.key});

  static const String name = 'RootScreen';
  final int? deeplinkBookId;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryTabsController, PrimaryTabsState>(
      bloc: CoreDi.getIt<PrimaryTabsController>(),
      builder: (context, state) {
        final controller = CoreDi.getIt<PrimaryTabsController>();
        final currentIndex = state.index;
        return Scaffold(
          body: AppLoaderStack(
            child: IndexedStack(
              key: UniqueKey(),
              index: currentIndex,
              children: <Widget>[
                Navigator(
                  key: controller.navigatorKeys[0],
                  onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                    HomeScreen(),
                  ),
                ),
                // Navigator(
                //   key: controller.navigatorKeys[1],
                //   onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                //     const SearchScreen(),
                //   ),
                // ),
                // Navigator(
                //   key: controller.navigatorKeys[2],
                //   onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                //     const LibraryScreen(),
                //   ),
                // ),
                // Navigator(
                //   key: controller.navigatorKeys[3],
                //   onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                //     //const SizedBox.shrink()
                //     const ProfileScreen(),
                //   ),
                // ),
              ],
            ),
          ),
          bottomNavigationBar: NavBar(
            current: currentIndex,
            switchTo: controller.switchToTab,
          ),
        );
      },
    );
  }
}

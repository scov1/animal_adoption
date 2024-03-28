import 'package:get_it/get_it.dart';

import '../../l10n/locale_repo.dart';
import '../../presentation/home_screen/data/bloc/bloc.dart';
import '../../presentation/home_screen/data/source/home_api.dart';
import '../../presentation/root/controller/primary_tab_controller.dart';
import '../root_gateway/root_gateway.dart';
import '../theme/repository/theme_repo.dart';

class CoreDi {
  static final getIt = GetIt.instance;

  static void register() {
    getIt.registerLazySingleton(() => RootGateway());
    getIt.registerSingleton(LocaleRepo());
    getIt.registerSingleton(ThemeRepo());
    getIt.registerSingleton(PrimaryTabsController(initial: 0));
    getIt.registerLazySingleton(
      () => HomeBloc(
        remote: HomeApi(
          api: getIt<RootGateway>(),
        ),
      ),
    );
  }
}

import 'package:get_it/get_it.dart';

import '../../details_pet/domain/entity/details_pet_entity.dart';
import '../../favorite/domain/entity/favorite_entity.dart';
import '../../l10n/locale_repo.dart';
import '../root_gateway/root_gateway.dart';
import '../theme/repository/theme_repo.dart';

class CoreDi {
  static final getIt = GetIt.instance;

  static void register() {
    getIt.registerLazySingleton(() => RootGateway());
    getIt.registerSingleton(LocaleRepo());
    getIt.registerSingleton(ThemeRepo());
    getIt.registerLazySingleton(() => DetailsPetEntity());
    getIt.registerLazySingleton(() => FavoriteEntity());
  }
}

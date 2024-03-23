import 'package:get_it/get_it.dart';

import '../../l10n/locale_repo.dart';
import '../theme/repository/theme_repo.dart';

class CoreDi {
  static final getIt = GetIt.instance;

  static void register() {
    getIt.registerSingleton(LocaleRepo());
    getIt.registerSingleton(ThemeRepo());
  }
}

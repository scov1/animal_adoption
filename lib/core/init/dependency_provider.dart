import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/data/repo/home_repo.dart';
import '../../home/domain/entity/home_entity.dart';
import '../../pets/data/repo/pets_repo.dart';
import '../../pets/domain/entity/pets_enitity.dart';
import '../../root/controller/primary_tab_controller.dart';
import '../root_gateway/root_gateway.dart';
import 'core_di.dart';

class DependencyProvider extends StatelessWidget {
  const DependencyProvider({required this.child, Key? key}) : super(key: key);

  final Widget Function(BuildContext context) child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PrimaryTabsController(initial: 0)),
        BlocProvider(
          create: (context) => HomeEntity(
            remote: HomeRepo(
              api: CoreDi.getIt<RootGateway>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PetsEntity(
              remoteHome: HomeRepo(
                api: CoreDi.getIt<RootGateway>(),
              ),
              remotePets: PetsRepo(
                api: CoreDi.getIt<RootGateway>(),
              )),
        )
      ],
      child: Builder(
        builder: child,
      ),
    );
  }
}

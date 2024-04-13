import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/home_screen/data/bloc/bloc.dart';
import '../../presentation/home_screen/data/source/home_api.dart';
import '../../presentation/pets_screen/data/bloc/bloc.dart';
import '../../presentation/pets_screen/data/source/pets_api.dart';
import '../root_gateway/root_gateway.dart';
import 'core_di.dart';

class DependencyProvider extends StatelessWidget {
  const DependencyProvider({required this.child, Key? key}) : super(key: key);

  final Widget Function(BuildContext context) child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            remote: HomeApi(
              api: CoreDi.getIt<RootGateway>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PetsBloc(
              remoteHome: HomeApi(
                api: CoreDi.getIt<RootGateway>(),
              ),
              remotePets: PetsApi(
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

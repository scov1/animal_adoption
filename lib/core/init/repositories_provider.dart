import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../presentation/home_screen/data/services/pets_service.dart';
import '../utils/error_handler/error_handler.dart';

class RepositoriesProvider extends StatelessWidget {
  const RepositoriesProvider({required this.child, Key? key}) : super(key: key);

  final Widget Function(BuildContext) child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // ChangeNotifierProvider<PetsService>(
        //   create: (context) => PetsService()..init(),
        // ),
        RepositoryProvider(
          create: (context) => ErrorHandler(),
        ),
      ],
      child: Builder(builder: child),
    );
  }
}

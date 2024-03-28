import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/errors_getter.dart';
import '../../../../data/dto/pets.dart';
import '../source/home_api.dart';

part 'event.dart';
part 'state.dart';
part 'parts/get_data_pets.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.remote}) : super(InitialHomeState()) {
    on<DataHomeEvent>(_getDataPets);
  }

  final HomeApi remote;
}

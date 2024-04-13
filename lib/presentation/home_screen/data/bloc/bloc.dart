import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/error_handler/error_handler.dart';
import '../../../../core/utils/errors_getter.dart';
import '../../../../data/dto/pet.dart';
import '../../../pets_screen/data/model/pagination.dart';
import '../source/home_api.dart';

part 'event.dart';
part 'state.dart';
part 'parts/get_data_pets.dart';
part 'parts/add_to_favorite.dart';
part 'parts/delete_favorite.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.remote}) : super(InitialHomeState()) {
    on<DataHomeEvent>(_getDataPets);
    on<AddToFavoriteHomeEvent>(_addToFavorites);
    on<DeleteFavoriteHomeEvent>(_deleteFavorite);
  }

  final HomeApi remote;
  List<Pet> petsList = [];
}

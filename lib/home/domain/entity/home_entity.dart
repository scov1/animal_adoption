import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/error_handler/error_handler.dart';
import '../../../data/vo/pet.dart';
import '../../../pets/domain/vo/pagination.dart';
import '../interface/i_home_repo.dart';

part 'event.dart';
part 'state.dart';
part 'parts/add_to_favorite.dart';
part 'parts/delete_favorite.dart';
part 'parts/get_data_pets.dart';

class HomeEntity extends Bloc<HomeEvent, HomeState> {
  HomeEntity({required this.remote}) : super(InitialHomeState()) {
    on<DataHomeEvent>(_getDataPets);
    on<AddToFavoriteHomeEvent>(_addToFavorites);
    on<DeleteFavoriteHomeEvent>(_deleteFavorite);
  }

  final IHomeRepo remote;
  List<Pet> petsList = [];
}

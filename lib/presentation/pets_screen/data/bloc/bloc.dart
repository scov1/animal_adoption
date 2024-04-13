import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/error_handler/error_handler.dart';
import '../../../../core/utils/errors_getter.dart';
import '../../../../data/dto/pet.dart';
import '../../../home_screen/data/source/home_api.dart';
import '../model/pagination.dart';
import '../source/pets_api.dart';

part 'event.dart';
part 'state.dart';
part 'parts/initial_pets.dart';
part 'parts/next_page_pets.dart';
part 'parts/add_to_favorite.dart';
part 'parts/delete_favorite.dart';
part 'parts/search_pets.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  PetsBloc({required this.remoteHome, required this.remotePets}) : super(LoadingPetsState()) {
    on<InitialPetsEvent>(_initialDataPets);
    on<NextPagePetsEvent>(_nextPagePets);
    on<AddToFavoritePetsEvent>(_addToFavorites);
    on<DeleteFavoritePetsEvent>(_deleteFavorite);
    on<SearchPetsEvent>(_searchPets);
  }

  late Pagination _pagination;
  final HomeApi remoteHome;
  final PetsApi remotePets;
  List<Pet> petsList = [];
}

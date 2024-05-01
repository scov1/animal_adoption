import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/error_handler/error_handler.dart';
import '../../../data/vo/pet.dart';
import '../../../home/domain/interface/i_home_repo.dart';
import '../interface/i_pets_repo.dart';
import '../vo/pagination.dart';

part 'event.dart';
part 'state.dart';
part 'parts/initial_pets.dart';
part 'parts/next_page_pets.dart';
part 'parts/add_to_favorite.dart';
part 'parts/delete_favorite.dart';
part 'parts/search_pets.dart';

class PetsEntity extends Bloc<PetsEvent, PetsState> {
  PetsEntity({required this.remoteHome, required this.remotePets}) : super(LoadingPetsState()) {
    on<InitialPetsEvent>(_initialDataPets);
    on<NextPagePetsEvent>(_nextPagePets);
    on<AddToFavoritePetsEvent>(_addToFavorites);
    on<DeleteFavoritePetsEvent>(_deleteFavorite);
    on<SearchPetsEvent>(_searchPets);
  }

  late Pagination _pagination;
  final IHomeRepo remoteHome;
  final IPetsRepo remotePets;
  List<Pet> petsList = [];
}

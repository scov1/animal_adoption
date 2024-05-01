import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_handler/error_handler.dart';
import '../../../data/vo/pet.dart';

part 'event.dart';
part 'state.dart';

class FavoriteEntity extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteEntity() : super(InitialFavoriteState()) {}
}

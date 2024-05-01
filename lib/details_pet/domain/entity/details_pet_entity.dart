import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/error_handler/error_handler.dart';

part 'state.dart';
part 'event.dart';
part 'parts/share_pet.dart';

class DetailsPetEntity extends Bloc<DetailsPetEvent, DetailsPetState> {
  DetailsPetEntity() : super(InitialDetailsPetState()) {
    on<ShareDetailsPetEvent>(_onSharePet);
  }
}

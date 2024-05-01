part of 'details_pet_entity.dart';

abstract class DetailsPetEvent {}

class ShareDetailsPetEvent extends DetailsPetEvent {
  ShareDetailsPetEvent({required this.petId});
  final String petId;
}

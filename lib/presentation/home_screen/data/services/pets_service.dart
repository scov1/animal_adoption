// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// import '../../../../data/dto/pet.dart';

// class PetsService extends ChangeNotifier {
//   late Box _box;

//   Future<void> init() async {
//     _box = await Hive.openBox('pet');
//   }

//   Future<void> addToFavorites(Pet pet) async {
//     await _box.add(pet);
//     notifyListeners();
//   }

//   Future<void> removeFromFavorites(Pet pet) async {
//     final index = _box.values.toList().indexWhere((element) => element.id == pet.id);

//     await _box.deleteAt(index);
//     notifyListeners();
//   }
// }

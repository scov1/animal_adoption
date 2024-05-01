import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/vo/pet.dart';

class PetsService extends ChangeNotifier {
  late Box _box;

  var listPets = <Pet>[];

  Future<void> init() async {
    _box = await Hive.openBox('pet');
    listPets = _box.values.map((dynamic pet) => pet as Pet).toList();
  }

  Future<void> addToFavorites(Pet pet) async {
    await _box.put(pet.id, pet);
    listPets.add(pet);
    notifyListeners();
  }

  Future<void> removePetFavorites(Pet pet) async {
    final index = _box.values.toList().indexWhere((element) => element.id == pet.id);

    await _box.deleteAt(index);
    listPets.removeAt(index);
    notifyListeners();
  }
}

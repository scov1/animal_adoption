import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return false;
    } else if (permission == LocationPermission.deniedForever) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<String?>> getLocation() async {
    try {
      final Map<dynamic, dynamic> locationData =
          await MethodChannel('location_channel').invokeMethod('getLocation');

      double latitude = locationData['latitude'];
      double longitude = locationData['longitude'];

      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      for (Placemark placemark in placemarks) {
        return [placemark.country, placemark.administrativeArea];
      }
    } on PlatformException catch (e) {
      return ["Failed to get location: '${e.message}'."];
    }
    return [];
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PetAdapter extends TypeAdapter<Pet> {
  @override
  final int typeId = 1;

  @override
  Pet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pet(
      id: fields[0] as String?,
      name: fields[1] as String?,
      vetstreetUrl: fields[2] as String?,
      temperament: fields[3] as String?,
      origin: fields[4] as String?,
      description: fields[5] as String?,
      lifeSpan: fields[6] as String?,
      adaptability: fields[7] as int?,
      affectionLevel: fields[8] as int?,
      childFriendly: fields[9] as int?,
      dogFriendly: fields[10] as int?,
      energyLevel: fields[11] as int?,
      intelligence: fields[12] as int?,
      socialNeeds: fields[13] as int?,
      strangerFriendly: fields[14] as int?,
      imageUrl: fields[15] as String?,
      catFriendly: fields[16] as int?,
      favoriteId: fields[17] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Pet obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.vetstreetUrl)
      ..writeByte(3)
      ..write(obj.temperament)
      ..writeByte(4)
      ..write(obj.origin)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.lifeSpan)
      ..writeByte(7)
      ..write(obj.adaptability)
      ..writeByte(8)
      ..write(obj.affectionLevel)
      ..writeByte(9)
      ..write(obj.childFriendly)
      ..writeByte(10)
      ..write(obj.dogFriendly)
      ..writeByte(11)
      ..write(obj.energyLevel)
      ..writeByte(12)
      ..write(obj.intelligence)
      ..writeByte(13)
      ..write(obj.socialNeeds)
      ..writeByte(14)
      ..write(obj.strangerFriendly)
      ..writeByte(15)
      ..write(obj.imageUrl)
      ..writeByte(16)
      ..write(obj.catFriendly)
      ..writeByte(17)
      ..write(obj.favoriteId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

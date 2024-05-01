import 'package:hive/hive.dart';

import 'images.dart';

part 'pet.g.dart';

class Pets {
  Pets({required this.pets, required this.petsAllCount});

  final List<Pet> pets;
  final int? petsAllCount;
}

@HiveType(typeId: 1)
class Pet {
  Pet({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
    this.image,
    this.imageUrl,
    this.catFriendly,
    this.favoriteId,
  });

  Weight? weight;
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  String? cfaUrl;
  @HiveField(2)
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  @HiveField(3)
  String? temperament;
  @HiveField(4)
  String? origin;
  String? countryCodes;
  String? countryCode;
  @HiveField(5)
  String? description;
  @HiveField(6)
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  @HiveField(7)
  int? adaptability;
  @HiveField(8)
  int? affectionLevel;
  @HiveField(9)
  int? childFriendly;
  @HiveField(10)
  int? dogFriendly;
  @HiveField(11)
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  @HiveField(12)
  int? intelligence;
  int? sheddingLevel;
  @HiveField(13)
  int? socialNeeds;
  @HiveField(14)
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;
  ImageDto? image;
  @HiveField(15)
  String? imageUrl;
  @HiveField(16)
  int? catFriendly;
  @HiveField(17)
  int? favoriteId;

  Pet.fromJson(Map<String, dynamic> json) {
    weight = json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    id = json['id'];
    name = json['name'];
    cfaUrl = json['cfa_url'];
    vetstreetUrl = json['vetstreet_url'];
    vcahospitalsUrl = json['vcahospitals_url'];
    temperament = json['temperament'];
    origin = json['origin'];
    countryCodes = json['country_codes'];
    countryCode = json['country_code'];
    description = json['description'];
    lifeSpan = json['life_span'];
    indoor = json['indoor'];
    lap = json['lap'];
    altNames = json['alt_names'];
    adaptability = json['adaptability'];
    affectionLevel = json['affection_level'];
    childFriendly = json['child_friendly'];
    dogFriendly = json['dog_friendly'];
    energyLevel = json['energy_level'];
    grooming = json['grooming'];
    healthIssues = json['health_issues'];
    intelligence = json['intelligence'];
    sheddingLevel = json['shedding_level'];
    socialNeeds = json['social_needs'];
    strangerFriendly = json['stranger_friendly'];
    vocalisation = json['vocalisation'];
    experimental = json['experimental'];
    hairless = json['hairless'];
    natural = json['natural'];
    rare = json['rare'];
    rex = json['rex'];
    suppressedTail = json['suppressed_tail'];
    shortLegs = json['short_legs'];
    wikipediaUrl = json['wikipedia_url'];
    hypoallergenic = json['hypoallergenic'];
    referenceImageId = json['reference_image_id'];
    catFriendly = json['catFriendly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['cfa_url'] = this.cfaUrl;
    data['vetstreet_url'] = this.vetstreetUrl;
    data['vcahospitals_url'] = this.vcahospitalsUrl;
    data['temperament'] = this.temperament;
    data['origin'] = this.origin;
    data['country_codes'] = this.countryCodes;
    data['country_code'] = this.countryCode;
    data['description'] = this.description;
    data['life_span'] = this.lifeSpan;
    data['indoor'] = this.indoor;
    data['lap'] = this.lap;
    data['alt_names'] = this.altNames;
    data['adaptability'] = this.adaptability;
    data['affection_level'] = this.affectionLevel;
    data['child_friendly'] = this.childFriendly;
    data['dog_friendly'] = this.dogFriendly;
    data['energy_level'] = this.energyLevel;
    data['grooming'] = this.grooming;
    data['health_issues'] = this.healthIssues;
    data['intelligence'] = this.intelligence;
    data['shedding_level'] = this.sheddingLevel;
    data['social_needs'] = this.socialNeeds;
    data['stranger_friendly'] = this.strangerFriendly;
    data['vocalisation'] = this.vocalisation;
    data['experimental'] = this.experimental;
    data['hairless'] = this.hairless;
    data['natural'] = this.natural;
    data['rare'] = this.rare;
    data['rex'] = this.rex;
    data['suppressed_tail'] = this.suppressedTail;
    data['short_legs'] = this.shortLegs;
    data['wikipedia_url'] = this.wikipediaUrl;
    data['hypoallergenic'] = this.hypoallergenic;
    data['reference_image_id'] = this.referenceImageId;
    data['catFriendly'] = this.catFriendly;
    return data;
  }

  Pet copyWith({bool? isFavorite}) {
    return Pet(
      weight: weight,
      id: id ?? this.id,
      name: name ?? this.name,
      cfaUrl: cfaUrl ?? this.cfaUrl,
      vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
      vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      countryCodes: countryCodes ?? this.countryCodes,
      countryCode: countryCode ?? this.countryCode,
      description: description ?? this.description,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      indoor: indoor ?? this.indoor,
      lap: lap ?? this.lap,
      altNames: altNames ?? this.altNames,
      adaptability: adaptability ?? this.adaptability,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      childFriendly: childFriendly ?? this.childFriendly,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      energyLevel: energyLevel ?? this.energyLevel,
      grooming: grooming ?? this.grooming,
      healthIssues: healthIssues ?? this.healthIssues,
      intelligence: intelligence ?? this.intelligence,
      sheddingLevel: sheddingLevel ?? this.sheddingLevel,
      socialNeeds: socialNeeds ?? this.socialNeeds,
      strangerFriendly: strangerFriendly ?? this.strangerFriendly,
      vocalisation: vocalisation ?? this.vocalisation,
      experimental: experimental ?? this.experimental,
      hairless: hairless ?? this.hairless,
      natural: natural ?? this.natural,
      rare: rare ?? this.rare,
      rex: rex ?? this.rex,
      suppressedTail: suppressedTail ?? this.suppressedTail,
      shortLegs: shortLegs ?? this.shortLegs,
      wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
      hypoallergenic: hypoallergenic ?? this.hypoallergenic,
      referenceImageId: referenceImageId ?? this.referenceImageId,
      catFriendly: catFriendly ?? this.catFriendly,
    );
  }
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}

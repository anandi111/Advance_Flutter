import 'package:flutter/foundation.dart';

class AnimalData {
  final String name;
  String? scientificName;
  final String prey;
  final String location;
  final String weight;
  final String height;
  final String lifespan;
  final String length;
  final String skinType;
  final String topSpeed;
  final String nameOfYoung;
  final String biggestThreat;

  AnimalData({
    required this.name,
    required this.scientificName,
    required this.prey,
    required this.location,
    required this.weight,
    required this.height,
    required this.lifespan,
    required this.length,
    required this.skinType,
    required this.topSpeed,
    required this.nameOfYoung,
    required this.biggestThreat,
  });

  factory AnimalData.fromMap({required Map e}) {
    return AnimalData(
      name: e["name"] ?? 'Animal',
      scientificName: e["taxonomy"]["scientific_name"] ?? "Animals",
      prey: e["characteristics"]["prey"] ?? "Grass, Meat",
      location: e["characteristics"]["location"] ?? "Gujarat",
      weight: e["characteristics"]["weight"] ?? "45.00 Kg",
      height: e["characteristics"]["height"] ?? "120 cm",
      lifespan: e["characteristics"]["lifespan"] ?? "10 years",
      length: e["characteristics"]["length"] ?? "2.5 meters",
      skinType: e["characteristics"]["skin_type"] ?? "Brown",
      topSpeed: e["characteristics"]["top_speed"] ?? "50 km/hours",
      nameOfYoung: e["characteristics"]["name_of_young"] ?? "cab",
      biggestThreat:
          e["characteristics"]["biggest_threat"] ?? "Habitat loss and hunting",
    );
  }
}

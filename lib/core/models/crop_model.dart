import 'dart:convert';

class CropModel {
  final int id;
  final String name;
  final String? description;
  final int? tenureInMonths;
  final double? price;
  final String? weather;
  final String? season;
  final int? harvestTimeInMonths;
  final String? careForGoodHarvest;
  final String? preferredPesticides;
  final String? cropFamily;
  final double? minPhValue;
  final String? typeOfCrop;
  final double? minTemp;
  final double? maxTemp;
  final double? minHumidity;
  final double? maxHumidity;
  final double? minRainfall;
  final double? maxRainfall;
  final double? nitrogenReq;
  final double? phosphorousReq;
  final double? potassiumReq;
  final double? maxPhValue;
  final String? imgUrl;
  final String fertilizers;
  final String soil;
  final String nutrients;
  final int sowingMonths;

  CropModel({
    required this.id,
    required this.name,
    this.description,
    this.tenureInMonths,
    this.price,
    this.weather,
    this.season,
    this.harvestTimeInMonths,
    this.careForGoodHarvest,
    this.preferredPesticides,
    this.cropFamily,
    this.minPhValue,
    this.typeOfCrop,
    this.minTemp,
    this.maxTemp,
    this.minHumidity,
    this.maxHumidity,
    this.minRainfall,
    this.maxRainfall,
    this.nitrogenReq,
    this.phosphorousReq,
    this.potassiumReq,
    this.maxPhValue,
    this.imgUrl,
    this.fertilizers = 'Compost',
    this.soil = 'Loamy',
    this.nutrients = 'N,P,K',
    this.sowingMonths = 3,
  });

  CropModel copyWith({
    int? id,
    String? name,
    String? description,
    int? tenureInMonths,
    double? price,
    String? weather,
    String? season,
    int? harvestTimeInMonths,
    String? careForGoodHarvest,
    String? preferredPesticides,
    String? cropFamily,
    double? minPhValue,
    String? typeOfCrop,
    double? minTemp,
    double? maxTemp,
    double? minHumidity,
    double? maxHumidity,
    double? minRainfall,
    double? maxRainfall,
    double? nitrogenReq,
    double? phosphorousReq,
    double? potassiumReq,
    double? maxPhValue,
    String? imgUrl,
    String? fertilizers,
    String? soil,
    String? nutrients,
    int? sowingMonths,
  }) {
    return CropModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      tenureInMonths: tenureInMonths ?? this.tenureInMonths,
      price: price ?? this.price,
      weather: weather ?? this.weather,
      season: season ?? this.season,
      harvestTimeInMonths: harvestTimeInMonths ?? this.harvestTimeInMonths,
      careForGoodHarvest: careForGoodHarvest ?? this.careForGoodHarvest,
      preferredPesticides: preferredPesticides ?? this.preferredPesticides,
      cropFamily: cropFamily ?? this.cropFamily,
      minPhValue: minPhValue ?? this.minPhValue,
      typeOfCrop: typeOfCrop ?? this.typeOfCrop,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      minHumidity: minHumidity ?? this.minHumidity,
      maxHumidity: maxHumidity ?? this.maxHumidity,
      minRainfall: minRainfall ?? this.minRainfall,
      maxRainfall: maxRainfall ?? this.maxRainfall,
      nitrogenReq: nitrogenReq ?? this.nitrogenReq,
      phosphorousReq: phosphorousReq ?? this.phosphorousReq,
      potassiumReq: potassiumReq ?? this.potassiumReq,
      maxPhValue: maxPhValue ?? this.maxPhValue,
      imgUrl: imgUrl ?? this.imgUrl,
      fertilizers: fertilizers ?? this.fertilizers,
      soil: soil ?? this.soil,
      nutrients: nutrients ?? this.nutrients,
      sowingMonths: sowingMonths ?? this.sowingMonths,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tenure_in_months': tenureInMonths,
      'price': price,
      'weather': weather,
      'season': season,
      'harvest_time_in_months': harvestTimeInMonths,
      'care_for_good_harvest': careForGoodHarvest,
      'preferred_pesticides': preferredPesticides,
      'crop_family': cropFamily,
      'min_ph_value': minPhValue,
      'type_of_crop': typeOfCrop,
      'min_temp': minTemp,
      'max_temp': maxTemp,
      'min_humidity': minHumidity,
      'max_humidity': maxHumidity,
      'min_rainfall': minRainfall,
      'max_rainfall': maxRainfall,
      'nitrogen_req': nitrogenReq,
      'phosphorous_req': phosphorousReq,
      'potassium_req': potassiumReq,
      'max_ph_value': maxPhValue,
      'img_url': imgUrl,
      'fertilizers': fertilizers,
      'soil': soil,
      'nutrients': nutrients,
      'sowing_months': sowingMonths,
    };
  }

  factory CropModel.fromMap(Map<String, dynamic> map) {
    return CropModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String?,
      tenureInMonths: map['tenure_in_months'] as int?,
      price: map['price'] as double?,
      weather: map['weather'] as String?,
      season: map['season'] as String?,
      harvestTimeInMonths: map['harvest_time_in_months'] as int?,
      careForGoodHarvest: map['care_for_good_harvest'] as String?,
      preferredPesticides: map['preferred_pesticides'] as String?,
      cropFamily: map['crop_family'] as String?,
      typeOfCrop: map['type_of_crop'] as String?,
      minTemp: map['min_temp'] as double?,
      maxTemp: map['max_temp'] as double?,
      minHumidity: (map['min_humidity']).toDouble() as double?,
      maxHumidity: (map['max_humidity']).toDouble() as double?,
      minRainfall: (map['min_rainfall']).toDouble() as double?,
      maxRainfall: (map['max_rainfall']).toDouble() as double?,
      nitrogenReq: (map['nitrogen_req']).toDouble() as double?,
      phosphorousReq: (map['phosphorous_req']).toDouble() as double?,
      potassiumReq: (map['potassium_req']).toDouble() as double?,
      maxPhValue: (map['max_ph_value']).toDouble() as double?,
      minPhValue: (map['min_ph_value']).toDouble() as double?,
      imgUrl: map['img_url'] as String?,
      fertilizers: map['fertilizers'] as String? ?? 'Compost',
      soil: map['soil'] as String? ?? 'Loamy',
      nutrients: map['nutrients'] as String? ?? 'N,P,K',
      sowingMonths: map['sowing_months'] as int? ?? 3,
    );
  }

  String toJson() => json.encode(toMap());

  factory CropModel.fromJson(String source) =>
      CropModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

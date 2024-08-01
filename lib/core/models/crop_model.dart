// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CropModel with EquatableMixin {
  final String name;
  final String description;
  final int tenure_in_months;
  final double price;
  final List<int> sowing_months;
  final List<String> soil;
  final List<String> nutrients;
  final String wheather;
  final String season;
  final List<String> fertilizers;
  final int harvest_time_in_months;
  final String care_for_good_harvest;
  final String preffered_pesticides;
  final String crop_family;
  final String pH_value;
  final String type_of_crop;
  final double min_temp;
  final double max_temp;
  final double min_humidity;
  final double max_humidity;
  final double min_rainfall;
  final double max_rainfall;
  final double nitrogen_req;
  final double phosphorous_req;
  final double postassium_req;
  const CropModel({
    required this.name,
    required this.description,
    required this.tenure_in_months,
    required this.price,
    required this.sowing_months,
    required this.soil,
    required this.nutrients,
    required this.wheather,
    required this.season,
    required this.fertilizers,
    required this.harvest_time_in_months,
    required this.care_for_good_harvest,
    required this.preffered_pesticides,
    required this.crop_family,
    required this.pH_value,
    required this.type_of_crop,
    required this.min_temp,
    required this.max_temp,
    required this.min_humidity,
    required this.max_humidity,
    required this.min_rainfall,
    required this.max_rainfall,
    required this.nitrogen_req,
    required this.phosphorous_req,
    required this.postassium_req,
  });

  CropModel copyWith({
    String? name,
    String? description,
    int? tenure_in_months,
    double? price,
    List<int>? sowing_months,
    List<String>? soil,
    List<String>? nutrients,
    String? wheather,
    String? season,
    List<String>? fertilizers,
    int? harvest_time_in_months,
    String? care_for_good_harvest,
    String? preffered_pesticides,
    String? crop_family,
    String? pH_value,
    String? type_of_crop,
    double? min_temp,
    double? max_temp,
    double? min_humidity,
    double? max_humidity,
    double? min_rainfall,
    double? max_rainfall,
    double? nitrogen_req,
    double? phosphorous_req,
    double? postassium_req,
  }) {
    return CropModel(
      name: name ?? this.name,
      description: description ?? this.description,
      tenure_in_months: tenure_in_months ?? this.tenure_in_months,
      price: price ?? this.price,
      sowing_months: sowing_months ?? this.sowing_months,
      soil: soil ?? this.soil,
      nutrients: nutrients ?? this.nutrients,
      wheather: wheather ?? this.wheather,
      season: season ?? this.season,
      fertilizers: fertilizers ?? this.fertilizers,
      harvest_time_in_months:
          harvest_time_in_months ?? this.harvest_time_in_months,
      care_for_good_harvest:
          care_for_good_harvest ?? this.care_for_good_harvest,
      preffered_pesticides: preffered_pesticides ?? this.preffered_pesticides,
      crop_family: crop_family ?? this.crop_family,
      pH_value: pH_value ?? this.pH_value,
      type_of_crop: type_of_crop ?? this.type_of_crop,
      min_temp: min_temp ?? this.min_temp,
      max_temp: max_temp ?? this.max_temp,
      min_humidity: min_humidity ?? this.min_humidity,
      max_humidity: max_humidity ?? this.max_humidity,
      min_rainfall: min_rainfall ?? this.min_rainfall,
      max_rainfall: max_rainfall ?? this.max_rainfall,
      nitrogen_req: nitrogen_req ?? this.nitrogen_req,
      phosphorous_req: phosphorous_req ?? this.phosphorous_req,
      postassium_req: postassium_req ?? this.postassium_req,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'tenure_in_months': tenure_in_months,
      'price': price,
      'sowing_months': sowing_months,
      'soil': soil,
      'nutrients': nutrients,
      'wheather': wheather,
      'season': season,
      'fertilizers': fertilizers,
      'harvest_time_in_months': harvest_time_in_months,
      'care_for_good_harvest': care_for_good_harvest,
      'preffered_pesticides': preffered_pesticides,
      'crop_family': crop_family,
      'pH_value': pH_value,
      'type_of_crop': type_of_crop,
      'min_temp': min_temp,
      'max_temp': max_temp,
      'min_humidity': min_humidity,
      'max_humidity': max_humidity,
      'min_rainfall': min_rainfall,
      'max_rainfall': max_rainfall,
      'nitrogen_req': nitrogen_req,
      'phosphorous_req': phosphorous_req,
      'postassium_req': postassium_req,
    };
  }

  factory CropModel.fromMap(Map<String, dynamic> map) {
    return CropModel(
      name: (map['name'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      tenure_in_months: (map['tenure_in_months'] ?? 0) as int,
      price: (map['price'] ?? 0.0) as double,
      sowing_months:
          List<int>.from((map['sowing_months'] ?? const <int>[]) as List<int>),
      soil:
          List<String>.from((map['soil'] ?? const <String>[]) as List<String>),
      nutrients: List<String>.from(
          (map['nutrients'] ?? const <String>[]) as List<String>),
      wheather: (map['wheather'] ?? '') as String,
      season: (map['season'] ?? '') as String,
      fertilizers: List<String>.from(
          (map['fertilizers'] ?? const <String>[]) as List<String>),
      harvest_time_in_months: (map['harvest_time_in_months'] ?? 0) as int,
      care_for_good_harvest: (map['care_for_good_harvest'] ?? '') as String,
      preffered_pesticides: (map['preffered_pesticides'] ?? '') as String,
      crop_family: (map['crop_family'] ?? '') as String,
      pH_value: (map['pH_value'] ?? '') as String,
      type_of_crop: (map['type_of_crop'] ?? '') as String,
      min_temp: (map['min_temp'] ?? 0.0) as double,
      max_temp: (map['max_temp'] ?? 0.0) as double,
      min_humidity: (map['min_humidity'] ?? 0.0) as double,
      max_humidity: (map['max_humidity'] ?? 0.0) as double,
      min_rainfall: (map['min_rainfall'] ?? 0.0) as double,
      max_rainfall: (map['max_rainfall'] ?? 0.0) as double,
      nitrogen_req: (map['nitrogen_req'] ?? 0.0) as double,
      phosphorous_req: (map['phosphorous_req'] ?? 0.0) as double,
      postassium_req: (map['postassium_req'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CropModel.fromJson(String source) =>
      CropModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      description,
      tenure_in_months,
      price,
      sowing_months,
      soil,
      nutrients,
      wheather,
      season,
      fertilizers,
      harvest_time_in_months,
      care_for_good_harvest,
      preffered_pesticides,
      crop_family,
      pH_value,
      type_of_crop,
      min_temp,
      max_temp,
      min_humidity,
      max_humidity,
      min_rainfall,
      max_rainfall,
      nitrogen_req,
      phosphorous_req,
      postassium_req,
    ];
  }
}

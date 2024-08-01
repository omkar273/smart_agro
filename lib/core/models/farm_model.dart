// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FarmModel with EquatableMixin {
  final String name;
  final String crop;
  final double moisture;
  final double lat;
  final double lng;
  final double temp;
  final String wheather;
  final String ownerId;
  const FarmModel({
    required this.name,
    required this.crop,
    required this.moisture,
    required this.lat,
    required this.lng,
    required this.temp,
    required this.wheather,
    required this.ownerId,
  });

  FarmModel copyWith({
    String? name,
    String? crop,
    double? moisture,
    double? lat,
    double? lng,
    double? temp,
    String? wheather,
    String? ownerId,
  }) {
    return FarmModel(
      name: name ?? this.name,
      crop: crop ?? this.crop,
      moisture: moisture ?? this.moisture,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      temp: temp ?? this.temp,
      wheather: wheather ?? this.wheather,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'crop': crop,
      'moisture': moisture,
      'lat': lat,
      'lng': lng,
      'temp': temp,
      'wheather': wheather,
      'ownerId': ownerId,
    };
  }

  factory FarmModel.fromMap(Map<String, dynamic> map) {
    return FarmModel(
      name: (map['name'] ?? '') as String,
      crop: (map['crop'] ?? '') as String,
      moisture: (map['moisture'] ?? 0.0) as double,
      lat: (map['lat'] ?? 0.0) as double,
      lng: (map['lng'] ?? 0.0) as double,
      temp: (map['temp'] ?? 0.0) as double,
      wheather: (map['wheather'] ?? '') as String,
      ownerId: (map['ownerId'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FarmModel.fromJson(String source) => FarmModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      crop,
      moisture,
      lat,
      lng,
      temp,
      wheather,
      ownerId,
    ];
  }
}

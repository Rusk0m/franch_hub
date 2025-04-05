import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'franchise.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class GeoPointConverter implements JsonConverter<GeoPoint, Map<String, dynamic>> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(Map<String, dynamic> json) {
    return GeoPoint(json['latitude'] as double, json['longitude'] as double);
  }

  @override
  Map<String, dynamic> toJson(GeoPoint geoPoint) => {
    'latitude': geoPoint.latitude,
    'longitude': geoPoint.longitude,
  };
}

@JsonSerializable(explicitToJson: true)
class Franchise {
  final String id;
  @JsonKey(name: 'franchisorId')
  final String franchisorId;
  final String name;
  final String industry;
  final Location location;
  final double totalRevenue;
  final double averageROI;
  final List<String> qualityStandards;

  @JsonKey()
  @TimestampConverter()
  final DateTime createdAt;

  Franchise({
    required this.id,
    required this.franchisorId,
    required this.name,
    required this.industry,
    required this.location,
    required this.totalRevenue,
    required this.averageROI,
    required this.qualityStandards,
    required this.createdAt,
  });

  factory Franchise.fromJson(Map<String, dynamic> json) =>
      _$FranchiseFromJson(json);
  Map<String, dynamic> toJson() => _$FranchiseToJson(this);

  Franchise copyWith({
    String? id,
    String? franchisorId,
    String? name,
    String? industry,
    Location? location,
    double? totalRevenue,
    double? averageROI,
    List<String>? qualityStandards,
    DateTime? createdAt,
  }) {
    return Franchise(
      id: id ?? this.id,
      franchisorId: franchisorId ?? this.franchisorId,
      name: name ?? this.name,
      industry: industry ?? this.industry,
      location: location ?? this.location,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      averageROI: averageROI ?? this.averageROI,
      qualityStandards: qualityStandards ?? this.qualityStandards,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Location {
  final String city;
  final String address;

  @JsonKey(name: 'coordinates')
  @GeoPointConverter()
  final GeoPoint coordinates;

  Location({
    required this.city,
    required this.address,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

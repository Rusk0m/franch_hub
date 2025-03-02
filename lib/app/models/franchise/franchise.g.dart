// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Franchise _$FranchiseFromJson(Map<String, dynamic> json) => Franchise(
      id: json['id'] as String,
      franchisorId: json['franchisorId'] as String,
      name: json['name'] as String,
      industry: json['industry'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      averageROI: (json['averageROI'] as num).toDouble(),
      qualityStandards: (json['qualityStandards'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$FranchiseToJson(Franchise instance) => <String, dynamic>{
      'id': instance.id,
      'franchisorId': instance.franchisorId,
      'name': instance.name,
      'industry': instance.industry,
      'location': instance.location.toJson(),
      'totalRevenue': instance.totalRevenue,
      'averageROI': instance.averageROI,
      'qualityStandards': instance.qualityStandards,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      city: json['city'] as String,
      address: json['address'] as String,
      coordinates: const GeoPointConverter()
          .fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'city': instance.city,
      'address': instance.address,
      'coordinates': const GeoPointConverter().toJson(instance.coordinates),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FranchiseModel _$FranchiseModelFromJson(Map<String, dynamic> json) =>
    FranchiseModel(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      industry: json['industry'] as String,
      city: json['city'] as String,
      startupCost: (json['startupCost'] as num).toDouble(),
      royaltyPercent: (json['royaltyPercent'] as num).toDouble(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      status: json['status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$FranchiseModelToJson(FranchiseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'description': instance.description,
      'industry': instance.industry,
      'city': instance.city,
      'startupCost': instance.startupCost,
      'royaltyPercent': instance.royaltyPercent,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'status': instance.status,
    };

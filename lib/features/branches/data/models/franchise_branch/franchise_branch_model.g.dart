// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FranchiseBranchModel _$FranchiseBranchModelFromJson(
        Map<String, dynamic> json) =>
    FranchiseBranchModel(
      id: json['id'] as String,
      name: json['name'] as String,
      franchiseId: json['franchiseId'] as String,
      ownerId: json['ownerId'] as String,
      location: json['location'] as String,
      royaltyPercent: (json['royaltyPercent'] as num).toDouble(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$FranchiseBranchModelToJson(
        FranchiseBranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'franchiseId': instance.franchiseId,
      'ownerId': instance.ownerId,
      'location': instance.location,
      'royaltyPercent': instance.royaltyPercent,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

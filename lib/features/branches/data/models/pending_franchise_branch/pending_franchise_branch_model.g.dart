// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_franchise_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingFranchiseBranchModel _$PendingFranchiseBranchModelFromJson(
        Map<String, dynamic> json) =>
    PendingFranchiseBranchModel(
      id: json['id'] as String,
      franchiseId: json['franchiseId'] as String,
      ownerId: json['ownerId'] as String,
      requesterId: json['requesterId'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      royaltyPercent: (json['royaltyPercent'] as num).toDouble(),
      workingHours: json['workingHours'] as String,
      phone: json['phone'] as String,
      status: json['status'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      moderatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['moderatedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$PendingFranchiseBranchModelToJson(
        PendingFranchiseBranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'franchiseId': instance.franchiseId,
      'ownerId': instance.ownerId,
      'requesterId': instance.requesterId,
      'name': instance.name,
      'location': instance.location,
      'royaltyPercent': instance.royaltyPercent,
      'workingHours': instance.workingHours,
      'phone': instance.phone,
      'status': instance.status,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'moderatedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.moderatedAt, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

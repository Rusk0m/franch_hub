// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FranchiseBranch _$FranchiseBranchFromJson(Map<String, dynamic> json) =>
    FranchiseBranch(
      id: json['id'] as String,
      franchiseId: json['franchiseId'] as String,
      ownerId: json['ownerId'] as String,
      royaltyPercent: (json['royaltyPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$FranchiseBranchToJson(FranchiseBranch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'franchiseId': instance.franchiseId,
      'ownerId': instance.ownerId,
      'royaltyPercent': instance.royaltyPercent,
    };

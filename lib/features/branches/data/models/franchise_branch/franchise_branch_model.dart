import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/core/utils/timestamp_converter.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'franchise_branch_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FranchiseBranchModel {
  final String id;
  final String franchiseId;
  final String ownerId;
  final String name;
  final String location;
  final double royaltyPercent;
  final String workingHours;
  final String phone;
  @TimestampConverter()
  final DateTime createdAt;

  FranchiseBranchModel({
    required this.id,
    required this.franchiseId,
    required this.ownerId,
    required this.name,
    required this.location,
    required this.royaltyPercent,
    required this.workingHours,
    required this.phone,
    required this.createdAt,
  });

  factory FranchiseBranchModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseBranchModelFromJson({
        ...json,
        'workingHours': json['workingHours'] ?? '',
        'phone': json['phone'] ?? '',
      });

  Map<String, dynamic> toJson() => _$FranchiseBranchModelToJson(this);

  FranchiseBranch toEntity() => FranchiseBranch(
    id: id,
    franchiseId: franchiseId,
    ownerId: ownerId,
    name: name,
    location: location,
    royaltyPercent: royaltyPercent,
    workingHours: workingHours,
    phone: phone,
    createdAt: createdAt,
  );

  factory FranchiseBranchModel.fromEntity(FranchiseBranch entity) => FranchiseBranchModel(
    id: entity.id,
    franchiseId: entity.franchiseId,
    ownerId: entity.ownerId,
    name: entity.name,
    location: entity.location,
    royaltyPercent: entity.royaltyPercent,
    workingHours: entity.workingHours,
    phone: entity.phone,
    createdAt: entity.createdAt,
  );
}
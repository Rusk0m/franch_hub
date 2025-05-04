import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/core/utils/timestamp_converter.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pending_franchise_branch_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PendingFranchiseBranchModel {
  final String id;
  final String franchiseId;
  final String ownerId;
  final String requesterId;
  final String name;
  final String location;
  final double royaltyPercent;
  final String workingHours;
  final String phone;
  final String status;
  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime? moderatedAt;

  PendingFranchiseBranchModel({
    required this.id,
    required this.franchiseId,
    required this.ownerId,
    required this.requesterId,
    required this.name,
    required this.location,
    required this.royaltyPercent,
    required this.workingHours,
    required this.phone,
    required this.status,
    required this.createdAt,
    this.moderatedAt,
  });

  factory PendingFranchiseBranchModel.fromJson(Map<String, dynamic> json) =>
      _$PendingFranchiseBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$PendingFranchiseBranchModelToJson(this);

  factory PendingFranchiseBranchModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return PendingFranchiseBranchModel(
      id: doc.id,
      franchiseId: data?['franchiseId'] ?? '',
      ownerId: data?['ownerId'] ?? '',
      requesterId: data?['requesterId'] ?? '',
      name: data?['name'] ?? '',
      location: data?['location'] ?? '',
      royaltyPercent: (data?['royaltyPercent'] as num?)?.toDouble() ?? 0.0,
      workingHours: data?['workingHours'] ?? '',
      phone: data?['phone'] ?? '',
      status: data?['status'] ?? 'pending',
      createdAt: TimestampConverter().fromJson(data?['createdAt']) ?? DateTime.now(),
      moderatedAt: data?['moderatedAt'] != null
          ? TimestampConverter().fromJson(data?['moderatedAt'])
          : null,
    );
  }

  PendingFranchiseBranch toEntity() => PendingFranchiseBranch(
    id: id,
    franchiseId: franchiseId,
    ownerId: ownerId,
    requesterId: requesterId,
    name: name,
    location: location,
    royaltyPercent: royaltyPercent,
    workingHours: workingHours,
    phone: phone,
    status: status,
    createdAt: createdAt,
    moderatedAt: moderatedAt,
  );

  factory PendingFranchiseBranchModel.fromEntity(PendingFranchiseBranch entity) =>
      PendingFranchiseBranchModel(
        id: entity.id,
        franchiseId: entity.franchiseId,
        ownerId: entity.ownerId,
        requesterId: entity.requesterId,
        name: entity.name,
        location: entity.location,
        royaltyPercent: entity.royaltyPercent,
        workingHours: entity.workingHours,
        phone: entity.phone,
        status: entity.status,
        createdAt: entity.createdAt,
        moderatedAt: entity.moderatedAt,
      );
}
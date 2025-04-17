import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'franchise_branch_model.g.dart';

@JsonSerializable()
class FranchiseBranchModel {
  final String id;
  final String name;
  final String franchiseId;
  final String ownerId;
  final String location;
  final double royaltyPercent;

  FranchiseBranchModel({
    required this.id,
    required this.name,
    required this.franchiseId,
    required this.ownerId,
    required this.location,
    required this.royaltyPercent,
  });

  factory FranchiseBranchModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseBranchModelToJson(this);

  FranchiseBranch toEntity() => FranchiseBranch(
    id: id,
    name: name,
    franchiseId: franchiseId,
    ownerId: ownerId,
    location: location,
    royaltyPercent: royaltyPercent,
  );

  factory FranchiseBranchModel.fromEntity(FranchiseBranch entity) => FranchiseBranchModel(
    id: entity.id,
    name: entity.name,
    franchiseId: entity.franchiseId,
    ownerId: entity.ownerId,
    location: entity.location,
    royaltyPercent: entity.royaltyPercent,
  );
}

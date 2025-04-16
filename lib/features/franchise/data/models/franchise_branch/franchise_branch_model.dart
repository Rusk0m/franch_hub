import 'package:json_annotation/json_annotation.dart';

part 'franchise_branch_model.g.dart';

@JsonSerializable()
class FranchiseBranch {
  final String id;
  final String franchiseId;
  final String ownerId;
  final double royaltyPercent;

  FranchiseBranch({
    required this.id,
    required this.franchiseId,
    required this.ownerId,
    required this.royaltyPercent,
  });

  factory FranchiseBranch.fromJson(Map<String, dynamic> json) =>
      _$FranchiseBranchFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseBranchToJson(this);
}

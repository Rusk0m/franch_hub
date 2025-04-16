import 'package:json_annotation/json_annotation.dart';

part 'franchise_model.g.dart';

@JsonSerializable()
class Franchise {
  final String id;
  final String ownerId;
  final String name;
  final String description;
  final String industry;
  final String city;
  final double startupCost;
  final double royaltyPercent;
  final DateTime createdAt;

  Franchise({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.description,
    required this.industry,
    required this.city,
    required this.startupCost,
    required this.royaltyPercent,
    required this.createdAt,
  });

  factory Franchise.fromJson(Map<String, dynamic> json) =>
      _$FranchiseFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseToJson(this);
}

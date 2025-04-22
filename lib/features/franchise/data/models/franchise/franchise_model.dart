import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/core/utils/timestamp_converter.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:json_annotation/json_annotation.dart';

part 'franchise_model.g.dart';

@JsonSerializable()
class FranchiseModel {
  final String id;
  final String ownerId;
  final String name;
  final String description;
  final String industry;
  final String city;
  final double startupCost;
  final double royaltyPercent;
  @TimestampConverter()
  final DateTime createdAt;

  FranchiseModel({
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

  factory FranchiseModel.fromJson(Map<String, dynamic> json) => _$FranchiseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseModelToJson(this);


  Franchise toEntity() => Franchise(
    id: id,
    ownerId: ownerId,
    name: name,
    description: description,
    industry: industry,
    city: city,
    startupCost: startupCost,
    royaltyPercent: royaltyPercent,
    createdAt: createdAt,
  );

  factory FranchiseModel.fromEntity(Franchise entity) => FranchiseModel(
    id: entity.id,
    ownerId: entity.ownerId,
    name: entity.name,
    description: entity.description,
    industry: entity.industry,
    city: entity.city,
    startupCost: entity.startupCost,
    royaltyPercent: entity.royaltyPercent,
    createdAt: entity.createdAt,
  );
}

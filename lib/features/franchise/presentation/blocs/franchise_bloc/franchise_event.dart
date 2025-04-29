part of 'franchise_bloc.dart';

abstract class FranchiseEvent extends Equatable {
  const FranchiseEvent();

  @override
  List<Object?> get props => [];
}

class LoadMyFranchises extends FranchiseEvent {
  final String ownerId;

  const LoadMyFranchises(this.ownerId);

  @override
  List<Object?> get props => [ownerId];
}

class LoadFranchiseBranches extends FranchiseEvent {
  final String franchiseId;

  const LoadFranchiseBranches(this.franchiseId);

  @override
  List<Object?> get props => [franchiseId];
}

class CreateFranchise extends FranchiseEvent {
  final String ownerId;
  final String name;
  final String description;
  final String industry;
  final String city;
  final double startupCost;
  final double royaltyPercent;

  const CreateFranchise({
    required this.ownerId,
    required this.name,
    required this.description,
    required this.industry,
    required this.city,
    required this.startupCost,
    required this.royaltyPercent,
  });

  @override
  List<Object?> get props =>
      [ownerId, name, description, industry, city, startupCost, royaltyPercent];
}

class LoadAllFranchises extends FranchiseEvent {}
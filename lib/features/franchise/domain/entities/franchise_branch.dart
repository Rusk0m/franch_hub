class FranchiseBranch {
  final String id;
  final String name;
  final String franchiseId;
  final String ownerId;
  final String location;
  final double royaltyPercent;// Роялти в %
  final DateTime createdAt;


  FranchiseBranch({
    required this.id,
    required this.name,
    required this.franchiseId,
    required this.ownerId,
    required this.location,
    required this.royaltyPercent,
    required this.createdAt,
  });
}

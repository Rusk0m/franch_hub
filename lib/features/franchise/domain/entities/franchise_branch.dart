class FranchiseBranch {
  final String id;
  final String franchiseId;
  final String ownerId;
  final double royaltyPercent;// Роялти в %

  FranchiseBranch({
    required this.id,
    required this.franchiseId,
    required this.ownerId,
    required this.royaltyPercent,
  });
}

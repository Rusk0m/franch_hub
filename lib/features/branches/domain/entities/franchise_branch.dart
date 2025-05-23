class FranchiseBranch {
  final String id;
  final String franchiseId;
  final String ownerId;
  final String name;
  final String location;
  final String workingHours;
  final String phone;
  final double royaltyPercent;// Роялти в %
  final DateTime createdAt;


  FranchiseBranch({
    required this.id,
    required this.franchiseId,
    required this.ownerId,
    required this.name,
    required this.location,
    required this.workingHours,
    required this.phone,
    required this.royaltyPercent,
    required this.createdAt,
  });
}

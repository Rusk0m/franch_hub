class PendingFranchiseBranch {
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
  final DateTime createdAt;
  final DateTime? moderatedAt;

  PendingFranchiseBranch({
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
}
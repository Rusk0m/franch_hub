class TransactionEntity {
  final String id;
  final String uid;
  final String branchId;
  final double amount;
  final String type; // например: royalty, investment, other
  final DateTime date;

  TransactionEntity({
    required this.id,
    required this.uid,
    required this.branchId,
    required this.amount,
    required this.type,
    required this.date,
  });
}

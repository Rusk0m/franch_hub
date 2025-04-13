class Transaction {
  final String id;
  final String branchId;
  final double amount;
  final String type; // например: royalty, investment, other
  final DateTime date;

  Transaction({
    required this.id,
    required this.branchId,
    required this.amount,
    required this.type,
    required this.date,
  });
}

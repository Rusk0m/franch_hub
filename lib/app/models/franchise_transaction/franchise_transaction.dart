import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'franchise_transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class FranchiseTransaction {
  final String id;
  @JsonKey(name: 'franchiseId')
  final String franchiseId;
  @JsonKey(name: 'franchiseeId')
  final String franchiseeId;
  final String type; // royalty, marketing, penalty
  final double amount;
  @JsonKey(
    fromJson: _dateTimeFromTimestamp,
    toJson: _dateTimeToTimestamp,
  )
  final DateTime date;
  final String status; // pending, paid, overdue
  final String? description;

  FranchiseTransaction({
    required this.id,
    required this.franchiseId,
    required this.franchiseeId,
    required this.type,
    required this.amount,
    required this.date,
    required this.status,
    this.description,
  });

  factory FranchiseTransaction.fromJson(Map<String, dynamic> json) =>
      _$FranchiseTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$FranchiseTransactionToJson(this);

  FranchiseTransaction copyWith({
    String? id,
    String? franchiseId,
    String? franchiseeId,
    String? type,
    double? amount,
    DateTime? date,
    String? status,
    String? description,
  }) {
    return FranchiseTransaction(
      id: id ?? this.id,
      franchiseId: franchiseId ?? this.franchiseId,
      franchiseeId: franchiseeId ?? this.franchiseeId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      status: status ?? this.status,
      description: description ?? this.description,
    );
  }

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) =>
      timestamp.toDate();
  static Timestamp _dateTimeToTimestamp(DateTime date) =>
      Timestamp.fromDate(date);
}
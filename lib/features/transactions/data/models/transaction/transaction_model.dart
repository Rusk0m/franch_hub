import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/core/utils/timestamp_converter.dart';
import 'package:franch_hub/features/transactions/domain/entities/transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  final String id;
  final String uid;
  final String branchId;
  final double amount;
  final String type;
  @TimestampConverter()
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.uid,
    required this.branchId,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);


  TransactionEntity toEntity() => TransactionEntity(
      id: id,
      uid: uid,
      branchId: branchId,
      amount: amount,
      type: type,
      date: date
  );

  factory TransactionModel.fromEntity(TransactionEntity entity) => TransactionModel(
        id: entity.id,
        uid: entity.uid,
        branchId: entity.branchId,
        amount: entity.amount,
        type: entity.type,
        date: entity.date,
      );
}

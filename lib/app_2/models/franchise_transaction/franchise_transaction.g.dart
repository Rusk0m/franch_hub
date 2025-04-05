// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FranchiseTransaction _$FranchiseTransactionFromJson(
        Map<String, dynamic> json) =>
    FranchiseTransaction(
      id: json['id'] as String,
      franchiseId: json['franchiseId'] as String,
      franchiseeId: json['franchiseeId'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: FranchiseTransaction._dateTimeFromTimestamp(
          json['date'] as Timestamp),
      status: json['status'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$FranchiseTransactionToJson(
        FranchiseTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'franchiseId': instance.franchiseId,
      'franchiseeId': instance.franchiseeId,
      'type': instance.type,
      'amount': instance.amount,
      'date': FranchiseTransaction._dateTimeToTimestamp(instance.date),
      'status': instance.status,
      'description': instance.description,
    };

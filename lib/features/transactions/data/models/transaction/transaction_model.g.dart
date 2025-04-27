// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String,
      uid: json['uid'] as String,
      branchId: json['branchId'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'branchId': instance.branchId,
      'amount': instance.amount,
      'type': instance.type,
      'date': const TimestampConverter().toJson(instance.date),
    };

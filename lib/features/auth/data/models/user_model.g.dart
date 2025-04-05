// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      franchiseId: json['franchiseId'] as String?,
      franchisorId: json['franchisorId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: UserModel._dateTimeFromTimestamp(json['createdAt']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'role': instance.role,
      'franchiseId': instance.franchiseId,
      'franchisorId': instance.franchisorId,
      'name': instance.name,
      'phone': instance.phone,
      'avatarUrl': instance.avatarUrl,
      'createdAt': UserModel._dateTimeToTimestamp(instance.createdAt),
    };

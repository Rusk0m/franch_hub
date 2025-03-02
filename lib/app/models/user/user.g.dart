// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      franchiseId: json['franchiseId'] as String?,
      franchisorId: json['franchisorId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: User._dateTimeFromTimestamp(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'role': instance.role,
      'franchiseId': instance.franchiseId,
      'franchisorId': instance.franchisorId,
      'name': instance.name,
      'phone': instance.phone,
      'avatarUrl': instance.avatarUrl,
      'createdAt': User._dateTimeToTimestamp(instance.createdAt),
    };

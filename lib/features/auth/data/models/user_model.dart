import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:franch_hub/core/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final String uid;
  final String email;
  final String role;
  final String? name;
  final String? phone;
  final String? avatarUrl;
  @JsonKey(
    fromJson: _dateTimeFromTimestamp,
    toJson: _dateTimeToTimestamp,
  )
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.role,
    this.name,
    this.phone,
    this.avatarUrl,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return UserModel(
      uid: data?['uid'] ?? doc.id,
      email: data?['email'] ?? '',
      role: data?['role'] ?? 'user',
      name: data?['name'],
      phone: data?['phone'],
      avatarUrl: data?['avatarUrl'],
      createdAt: _dateTimeFromTimestamp(data?['createdAt']),
    );
  }

  static DateTime _dateTimeFromTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    }
    return DateTime.now();
  }

  static Timestamp _dateTimeToTimestamp(DateTime date) => Timestamp.fromDate(date);

  UserEntity toEntity() => UserEntity(
    uid: uid,
    email: email,
    role: role,
    name: name,
    phone: phone,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
  );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
    uid: entity.uid,
    email: entity.email,
    role: entity.role,
    name: entity.name,
    phone: entity.phone,
    avatarUrl: entity.avatarUrl,
    createdAt: entity.createdAt,
  );

  static final empty = UserModel(
    uid: '',
    email: '',
    role: 'user',
    name: null,
    avatarUrl: null,
    createdAt: DateTime(1970),
    phone: null,
  );
}
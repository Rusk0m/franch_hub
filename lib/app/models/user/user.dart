import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String uid;
  final String email;
  final String role;
  @JsonKey(name: 'franchiseId')
  final String? franchiseId;
  @JsonKey(name: 'franchisorId')
  final String? franchisorId;
  final String? name;
  final String? phone;
  final String? avatarUrl;
  @JsonKey(
    fromJson: _dateTimeFromTimestamp,
    toJson: _dateTimeToTimestamp,
  )
  final DateTime createdAt;

  static var empty = User(
    uid: '',
    email: '',
    role: '',
    createdAt: DateTime(1970),
  );

  const User({
    required this.uid,
    required this.email,
    required this.role,
    this.franchiseId,
    this.franchisorId,
    this.name,
    this.phone,
    this.avatarUrl,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      uid: data['uid'] ?? doc.id,
      email: data['email'] ?? '',
      role: data['role'] ?? 'user',
      franchiseId: data['franchiseId'],
      franchisorId: data['franchisorId'],
      name: data['name'],
      phone: data['phone'],
      avatarUrl: data['avatarUrl'],
      createdAt: _dateTimeFromTimestamp(data['createdAt']),
    );
  }

  User copyWith({
    String? uid,
    String? email,
    String? role,
    String? franchiseId,
    String? franchisorId,
    String? name,
    String? phone,
    String? avatarUrl,
    DateTime? createdAt,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      role: role ?? this.role,
      franchiseId: franchiseId ?? this.franchiseId,
      franchisorId: franchisorId ?? this.franchisorId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static DateTime _dateTimeFromTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    }
    return DateTime.now();
  }

  static Timestamp _dateTimeToTimestamp(DateTime date) => Timestamp.fromDate(date);
}
class UserEntity {
  final String uid;
  final String email;
  final String role;
  final String? name;
  final String? phone;
  final String? avatarUrl;
  final DateTime createdAt;

  static UserEntity empty = UserEntity(
    uid: '',
    email: '',
    role: '',
    createdAt: DateTime(1970),
  );

  const UserEntity({
    required this.uid,
    required this.email,
    required this.role,
    this.name,
    this.phone,
    this.avatarUrl,
    required this.createdAt,
  });

  UserEntity copyWith({
    String? uid,
    String? email,
    String? role,
    String? name,
    String? phone,
    String? avatarUrl,
    DateTime? createdAt,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      role: role ?? this.role,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
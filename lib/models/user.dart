// نموذج المستخدم
class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
  });

  // تحويل من JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  // تحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }

  // نسخ مع تعديل
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
    );
  }
}

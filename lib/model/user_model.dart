class UserModel {
  final String uid;
  final String email;
  // 'establishment' or 'contractor'
  final String role; 
  final String name;
  final String phoneNumber;
  final DateTime registeredAt;
  final String profileImageUrl;

  UserModel({
    required this.uid,
    required this.email,
    required this.role,
    required this.name,
    required this.phoneNumber,
    required this.registeredAt,
    this.profileImageUrl = '',
  });

  // Method to convert UserModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'name': name,
      'phoneNumber': phoneNumber,
      'registeredAt': registeredAt.toIso8601String(),
      'profileImageUrl': profileImageUrl,
    };
  }

  // Method to create a UserModel object from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      registeredAt: DateTime.parse(map['registeredAt']),
      profileImageUrl: map['profileImageUrl'] ?? '',
    );
  }
}

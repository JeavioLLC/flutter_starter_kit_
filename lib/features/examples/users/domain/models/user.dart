class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.largeAvatarUrl,
    required this.country,
    this.age,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String largeAvatarUrl;
  final String country;
  final int? age;

  String get fullName => '$firstName $lastName';
}

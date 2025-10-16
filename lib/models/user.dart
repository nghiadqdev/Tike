class User {
  User({
    required this.id,
    required this.email,
    required this.username,
    this.avatar,
    this.point = 0,
    this.biomatric = false,
  });

  final String id;
  final String email;
  final String username;
  final String? avatar;
  final double point;
  final bool biomatric;
}

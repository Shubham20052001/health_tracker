class UserModel {
  final String uid;
  final String? email;
  final String? name;
  final double? height;
  final double? weight;

  UserModel({
    required this.uid,
    this.email,
    this.name,
    this.height,
    this.weight,
  });
}

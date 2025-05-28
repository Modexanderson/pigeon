
class UserEntity {
  final String id;
  final String? name;
  final String email;
  final String? phone;
  final String? birthDay;
  final String? sex;
  final List<dynamic> interests;

  UserEntity({
    required this.id,
    required this.email,
    this.name,
    this.phone,
    this.birthDay,
    this.sex,
    this.interests = const [],
  });

}

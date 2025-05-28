import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pigeon/screens/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    super.name,
    super.phone,
    super.birthDay,
    super.sex,
    super.interests,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      birthDay: json['birthDay'],
      sex: json['sex'],
      interests: json['interests'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'birthDay': birthDay,
      'sex': sex,
      'interests': interests,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      email: data['email'],
      name: data['name'],
      phone: data['phone'],
      birthDay: data['birthDay'],
      sex: data['sex'],
      interests: data['interests'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'birthDay': birthDay,
      'sex': sex,
      'interests': interests
    };
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      phone: user.phone,
      birthDay: user.birthDay,
      sex: user.sex,
      interests: user.interests,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      phone: phone,
      birthDay: birthDay,
      sex: sex,
      interests: interests,
      
    );
  }
}

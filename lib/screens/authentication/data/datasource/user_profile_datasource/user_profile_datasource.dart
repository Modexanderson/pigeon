import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pigeon/screens/authentication/data/datasource/user_profile_datasource/user_profile_service_interface.dart';
import 'package:pigeon/screens/authentication/data/model/user_model.dart';

import '../../../../../core/globals/firebase_globals.dart';

class UserProfileService implements UserProfileServiceInterface {
  @override
  Future<UserModel> getUserProfile(String userId) async {
    try {
      final docSnapshot =
          await firestore.collection('users').doc(userId).get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        return UserModel.fromFirestore(docSnapshot);
      } else {
        throw Exception('Kullanıcı bulunamadı');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }

  @override
  Future<UserModel> createUserProfile(UserModel user) async {
    try {
      await firestore
          .collection('users')
          .doc(user.id)
          .set(user.toFirestore(), SetOptions(merge: true));
      return user;
    } catch (e) {
      throw Exception('Bir hata oluştu');
    }
  }

  @override
  Future<UserModel> updateUserProfile(UserModel user) async {
    try {
      await firestore
          .collection('users')
          .doc(user.id)
          .update(user.toFirestore());
      return user;
    } catch (e) {
      throw Exception('Bir hata oluştu');
    }
  }
}

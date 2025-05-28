
import 'package:pigeon/screens/authentication/data/model/user_model.dart';

abstract class UserProfileServiceInterface {
  Future<UserModel> getUserProfile(String userId);
  Future<UserModel> createUserProfile(UserModel user);
  Future<UserModel> updateUserProfile(UserModel user);
}

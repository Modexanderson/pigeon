
import 'package:dartz/dartz.dart';
import 'package:pigeon/core/errors/errors.dart';
import 'package:pigeon/screens/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpWithEmail(
      String email, String password,String name, String phone);
  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> createUserProfile(UserEntity userEntity);
  Future<Either<Failure, UserEntity>> updateUserProfile(UserEntity userEntity);
  Future<Either<Failure, UserEntity>> getUserProfile(String userID);
  Future<Either<Failure, void>> signOut();
}

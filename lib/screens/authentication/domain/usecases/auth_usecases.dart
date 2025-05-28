import 'package:dartz/dartz.dart';
import 'package:pigeon/core/errors/errors.dart';
import 'package:pigeon/screens/authentication/domain/entities/user_entity.dart';
import 'package:pigeon/screens/authentication/domain/repository/auth_repository.dart';

class AuthUseCases {
  final AuthRepository authRepository;

  AuthUseCases(this.authRepository);

  Future<Either<Failure, UserEntity>> signUpWithEmail(
      String email, String password, String name, String phone) async {
    return authRepository.signUpWithEmail(email, password, name, phone);
  }

  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password) async {
    return authRepository.signInWithEmail(email, password);
  }

  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    return authRepository.signInWithGoogle();
  }

  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    return authRepository.signInWithFacebook();
  }

  Future<Either<Failure, void>> signOut() async {
    return authRepository.signOut();
  }

  Future<Either<Failure, UserEntity>> createUserProfile(UserEntity userEntity) async {
    return authRepository.createUserProfile(userEntity);
  }

Future<Either<Failure, UserEntity>> updateUserProfile(UserEntity userEntity) async {
    return authRepository.updateUserProfile(userEntity);
  }
  Future<Either<Failure, UserEntity>> getUserProfile(String userID) async {
    return authRepository.getUserProfile(userID);
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pigeon/core/constants/app_colors.dart';
import 'package:pigeon/core/errors/errors.dart';
import 'package:pigeon/core/errors/firebase_error_codes.dart';
import 'package:pigeon/core/globals/firebase_globals.dart';
import 'package:pigeon/core/widgets/app_snackbar.dart';
import 'package:pigeon/screens/authentication/data/datasource/auth_datasource/auth_datasource_interface.dart';
import 'package:pigeon/screens/authentication/data/datasource/user_profile_datasource/user_profile_service_interface.dart';
import 'package:pigeon/screens/authentication/data/model/user_model.dart';
import 'package:pigeon/screens/authentication/domain/entities/user_entity.dart';
import 'package:pigeon/screens/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.dataSource, this.userProfileService);

  final AuthDataSourceInterface dataSource;
  final UserProfileServiceInterface userProfileService;

  @override
  Future<Either<Failure, UserModel>> signUpWithEmail(
      String email, String password, String? name, String? phone) async {
    try {
      final userCredential = await dataSource.signUpWithEmail(email, password);
      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: name,
          phone: phone);
      try {
        await userProfileService.createUserProfile(userModel);
      } catch (e) {
        return Left(
            AnyFailure(errorMessage: e.toString(), color: AppColors.redColor));
      }
      return Right(userModel);
    } on FirebaseException catch (e) {
      String errorMessage = firebaseErrorMessage(e.code);
      return Left(AnyFailure(errorMessage: errorMessage));
    }
    catch (e) {
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password) async {
    try {
      final userCredential = await dataSource.signInWithEmail(email, password);
      final userDoc = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (userCredential.user == null) {
        return Left(AnyFailure(errorMessage: "Kullanıcı Bulunamadı"));
      } else {
        if (userDoc.exists) {
          final userData = userDoc.data()!;
          // final List<dynamic> rawListings = userData['listings'];
          // final List<Listing> listings = rawListings.map((listingData) {
          //   return Listing.fromMap(listingData);
          // }).toList();
          UserModel userModel = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email!,
            name: userData['name'],
            phone: userData['phone'],
            birthDay: userData['birthDay'],
            sex: userData['sex'],
            interests: userData['interests'],

          );
          return Right(userModel);
        }
      }
      return Left(AnyFailure(errorMessage: "Kullanıcı Bilgileri Bulunamadı"));
    } catch (e) {
      print(e.toString());
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final userCredential = await dataSource.signInWithGoogle();
      if (userCredential.user != null) {
        final user = UserModel(
            id: userCredential.user!.uid, email: userCredential.user!.email!);
        if (userCredential.additionalUserInfo != null &&
            userCredential.additionalUserInfo!.isNewUser) {
          try {
            final UserEntity userEntity =
                await userProfileService.createUserProfile(user);
            return Right(userEntity);
          } catch (e) {
            if (kDebugMode) {
              print(e.toString());
            }
          }
          throw Exception('Bir Hata Oluştu');
        } else {
          final userDoc = await firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .get();
          if (userDoc.exists) {
            final userData = userDoc.data()!;
            // final List<dynamic> rawListings = userData['listings'];
            // final List<String> listings = rawListings.map((listingData) {
            //   return Listing.fromMap(listingData);
            // }).toList();
            UserEntity userEntity = UserModel(
              id: userCredential.user!.uid,
              email: userCredential.user!.email!,
              name: userData['name'],
              phone: userData['phone'],
              birthDay: userData['birthDay'],
              sex: userData['sex'],
              interests: userData['interests'],
            ).toEntity();
            return Right(userEntity);
          }
        }
        return Left(AnyFailure(errorMessage: "Kullanıcı Bilgileri Bulunamadı"));
      } else {
        return Left(AnyFailure(errorMessage: 'Giriş Yaparken Bir Hata Oluştu'));
      }
    } on FirebaseException catch (e) {
      String errorMessage = firebaseErrorMessage(e.code);
      return Left(AnyFailure(errorMessage: errorMessage));
    } catch (e) {
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final userCredential = await dataSource.signInWithFacebook();
      if (userCredential.user != null) {
        final user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email != null
                ? userCredential.user!.email!
                : '');
        if (userCredential.additionalUserInfo != null &&
            userCredential.additionalUserInfo!.isNewUser) {
          try {
            final UserEntity userEntity =
                await userProfileService.createUserProfile(user);
            return Right(userEntity);
          } catch (e) {
            // showSnackBar(e.toString(), AppColors.redColor);
          }
          throw Exception('Bir Hata Oluştu');
        } else {
          final userDoc = await firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .get();
          if (userDoc.exists) {
            final userData = userDoc.data()!;
            // final List<dynamic> rawListings = userData['listings'];
            // final List<Listing> listings = rawListings.map((listingData) {
            //   return Listing.fromMap(listingData);
            // }).toList();
            UserEntity userEntity = UserModel(
              id: userCredential.user!.uid,
              email: userCredential.user!.email!,
              name: userData['name'],
              phone: userData['phone'],
              birthDay: userData['birthDay'],
              sex: userData['sex'],
              interests: userData['interests'],
            ).toEntity();
            return Right(userEntity);
          }
        }
        return Left(AnyFailure(errorMessage: 'Kullanıcı Bilgilerine Ulaşılamadı'));
      } else {
        return Left(AnyFailure(errorMessage: 'Giriş Yaparken Bir Hata Oluştu'));
      }
    } on FirebaseException catch (e) {
      print('heeyır');
      String errorMessage = firebaseErrorMessage(e.code);
      return Left(AnyFailure(errorMessage: errorMessage));
    }catch (e) {
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> createUserProfile(UserEntity user) async {
    try {
      final userModel = UserModel(
        id: user.id,
        email: user.email,
        name: user.name,
        phone: user.phone,
        birthDay: user.birthDay,
        sex: user.sex,
        interests: user.interests,

      );
      await userProfileService.createUserProfile(userModel);
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile(
      UserEntity userEntity) async {
    try {
      final UserModel userModel = UserModel(
          id: userEntity.id,
          email: userEntity.email,
          name: userEntity.name,
          phone: userEntity.phone,
          birthDay: userEntity.birthDay,
          sex: userEntity.sex,
          interests: userEntity.interests);
      await userProfileService.updateUserProfile(userModel);
      return Right(userModel.toEntity());
    } catch (e) {
      if (e is FirebaseException) {
        print('FirebaseException Code: ${e.code}');
        print('FirebaseException Message: ${e.message}');
      }
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserProfile(String userId) async {
    try {
      final userModel = await userProfileService.getUserProfile(userId);
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await dataSource.signOut();
      return Right(showSnackBar('Hesabınızdan Başarıyla Çıkış Yaptınız'));
    } catch (e) {
      print(e);
      return Left(AnyFailure(errorMessage: e.toString()));
    }
  }
}

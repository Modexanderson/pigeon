import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pigeon/core/constants/navigator_key.dart';
import 'package:pigeon/screens/authentication/data/datasource/auth_datasource/auth_datasource.dart';
import 'package:pigeon/screens/authentication/data/datasource/user_profile_datasource/user_profile_datasource.dart';
import 'package:pigeon/screens/authentication/data/repository/auth_repository.dart';
import 'package:pigeon/screens/authentication/domain/entities/user_entity.dart';
import 'package:pigeon/screens/authentication/domain/repository/auth_repository.dart';
import 'package:pigeon/screens/home/home_screen.dart';
import '../../../domain/usecases/auth_usecases.dart';
import '../../view/sign_in_screen.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.authUseCases) : super(AuthState());
  final AuthUseCases authUseCases;

  Future<void> signUpWithEmail(
      String email, String password, String name, String phone) async {
    state =
        state.copyWith(isLoading: true, errorMessage: null, isLoggedIn: false);
    final userCredential =
        await authUseCases.signUpWithEmail(email, password, name, phone);
    userCredential.fold(
        (failure) => state = state.copyWith(
            isLoading: false, errorMessage: failure.errorMessage), (user) {
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) =>  HomeScreen(),
      ));
      state = state.copyWith(
          isLoading: false, errorMessage: null, isLoggedIn: true, user: user);
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    state =
        state.copyWith(isLoading: true, errorMessage: null, isLoggedIn: false);
    final userCredential = await authUseCases.signInWithEmail(email, password);
    userCredential.fold(
        (failure) => state = state.copyWith(
            isLoading: false, errorMessage: failure.errorMessage), (user) {
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
      state = state.copyWith(
          isLoading: false, errorMessage: null, isLoggedIn: true, user: user);
    });
  }

  Future<void> signInWithGoogle() async {
    state =
        state.copyWith(isLoading: true, isLoggedIn: false, errorMessage: null);
    final userCredential = await authUseCases.signInWithGoogle();
    userCredential.fold(
        (failure) => state = state.copyWith(
            errorMessage: failure.errorMessage,
            isLoading: false,
            isLoggedIn: false), (user) {
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
      state = state.copyWith(
          errorMessage: null, isLoggedIn: true, isLoading: false, user: user);
    });
  }

  Future<void> signInWithFacebook() async {
    state =
        state.copyWith(isLoading: true, isLoggedIn: false, errorMessage: null);
    final userCredential = await authUseCases.signInWithFacebook();
    userCredential.fold(
        (failure) => state = state.copyWith(
            errorMessage: failure.errorMessage,
            isLoading: false,
            isLoggedIn: false), (user) {
      state = state.copyWith(
          errorMessage: null, isLoggedIn: true, isLoading: false, user: user);
    });
  }

  Future<void> createUserProfile(UserEntity userEntity) async {
    state.copyWith(isLoading: true, errorMessage: null);
    final createUserProfile = await authUseCases.createUserProfile(userEntity);
    createUserProfile.fold(
        (failure) => state = state.copyWith(
            isLoading: false, errorMessage: failure.errorMessage),
        (user) => state = state.copyWith(isLoading: false, user: user));
  }

  Future<void> updateUserProfile(UserEntity userEntity) async {
    state =
        state.copyWith(isLoading: true, errorMessage: null, user: userEntity);
    final updateUserProfile = await authUseCases.updateUserProfile(userEntity);
    updateUserProfile.fold(
        (failure) => state = state.copyWith(
            errorMessage: failure.errorMessage, isLoading: false),
        (user) => state =
            state.copyWith(isLoading: false, errorMessage: null, user: user));
  }

  Future<void> getUserProfile(String userID) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );
    final getUserProfile = await authUseCases.getUserProfile(userID);
    getUserProfile.fold(
        (failure) => state.copyWith(
            errorMessage: failure.errorMessage, isLoading: false),
        (user) => state =
            state.copyWith(user: user, isLoading: false, errorMessage: null));
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final signOut = await authUseCases.signOut();
    signOut.fold(
        (failure) => state = state.copyWith(
              errorMessage: failure.errorMessage,
              isLoading: false,
            ), (r) {
            navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: 
            (context) => const SignInScreen(),
            ), (route) => false);
      state = state.copyWith(isLoading: false, isLoggedIn: false);
    });
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authUseCases = ref.read(authUseCasesProvider);
  return AuthNotifier(authUseCases);
});
final authUseCasesProvider = Provider<AuthUseCases>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthUseCases(authRepository);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.read(authDataSourceProvider);
  final userProfileService = ref.read(userProfileServiceProvider);
  return AuthRepositoryImpl(authDataSource, userProfileService);
});

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource();
});

final userProfileServiceProvider = Provider<UserProfileService>((ref) {
  return UserProfileService();
});

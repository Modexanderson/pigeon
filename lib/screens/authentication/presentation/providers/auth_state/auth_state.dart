
import 'package:pigeon/screens/authentication/domain/entities/user_entity.dart';

class AuthState {
  final UserEntity? user;
  final bool isLoading;
  final String? errorMessage;
  final bool? isLoggedIn;

  AuthState(
      {this.user, this.isLoading = false, this.errorMessage, this.isLoggedIn});

  AuthState copyWith({
    UserEntity? user,
    bool? isLoading,
    String? errorMessage,
    bool? isLoggedIn,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

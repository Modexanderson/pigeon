import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSourceInterface {
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
  Future<void> signOut();
}

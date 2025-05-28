
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:pigeon/core/errors/firebase_error_codes.dart';
import 'package:pigeon/core/globals/firebase_globals.dart';
import 'package:pigeon/screens/authentication/data/datasource/auth_datasource/auth_datasource_interface.dart';

class AuthDataSource implements AuthDataSourceInterface {
  @override
  Future<UserCredential> signUpWithEmail(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = firebaseErrorMessage(e.code);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      String errorMessage = firebaseErrorMessage(e.code);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        UserCredential userCredential =
            await firebaseAuth.signInWithPopup(googleProvider);
        return userCredential;
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        if (googleAuth?.accessToken != null || googleAuth?.idToken != null) {
          final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
              await firebaseAuth.signInWithCredential(credential);
          return userCredential;
        }
      }
      throw '';
    } on FirebaseException catch (e) {
      String errorMessage = firebaseErrorMessage(e.code);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );
      if (loginResult.accessToken != null) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);
        return userCredential;
      }
      throw '';
    } on FirebaseException catch (e) {
      String errorMessage = firebaseErrorMessage(e.code);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

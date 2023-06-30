//AUTH PROVIDER FROM THE FIREBASEAUTH SERVISE

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gov_track_sa/screens/screen_barrel.dart';
import 'package:gov_track_sa/utilities/show_snack_bar.dart';
import '../../firebase_options.dart';
import 'auth_exceptions.dart';
import 'auth_provider.dart';
import 'auth_user.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          showSnackBar(
              "User not found, you need to sign-up an account to proceed.",
              context);
          throw UserNotFoundAuthException();
        case 'invalid-email':
          showSnackBar("Please enter a valid email.", context);
          throw InvalidEmailAuthException();
        case 'wrong-password':
          showSnackBar("Incorrect password.", context);
          throw WrongPasswordAuthException();
        case 'user-disabled':
          showSnackBar(
              "Access revoked. Please contact admit at siya3.cyril@gmail.com.",
              context);
          throw UserDisabledAuthException();
        case 'network-request-failed':
          showSnackBar(
              "Network request failed. Please check your internet connection.",
              context);
          throw NetworkRequestFailedAuthException();
        case 'timeout':
          showSnackBar("Request timed out. Please try again later.", context);
          throw TimeoutAuthException();
        case 'internal-error':
          showSnackBar(
              "Internal error occurred. Please try again later.", context);
          throw InternalErrorAuthException();

        default:
          log("Firebase Generic Auth Exception: $e.toString()");
          showSnackBar("An error occurred. Please try again.", context);
          throw GenericAuthException();
      }
    } catch (e) {
      log("Generic Auth Exception: $e.toString()");
      showSnackBar("An error occurred. Please try again.", context);
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut({required BuildContext context}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<AuthUser> register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          showSnackBar(
              "An account with this email already exists. Please try a different email or login.",
              context);
          throw EmailAlreadyInUseAuthException();
        case 'invalid-email':
          showSnackBar("Please enter a valid email.", context);
          throw InvalidEmailAuthException();
        case 'operation-not-allowed':
          showSnackBar(
              "Login failed. Please contact support for assistance at siya3.cyril@gmail.com",
              context);
          throw OperationNotAllowedAuthException();
        case 'weak-password':
          showSnackBar("Password must be 6 or more characters.", context);
          throw WeakPasswordAuthException();
        case 'network-request-failed':
          showSnackBar(
              "Network request failed. Please check your internet connection.",
              context);
          throw NetworkRequestFailedAuthException();
        case 'timeout':
          showSnackBar("Request timed out. Please try again later.", context);
          throw TimeoutAuthException();
        case 'internal-error':
          showSnackBar(
              "Internal error occurred. Please try again later.", context);
          throw InternalErrorAuthException();
        default:
          log("Firebase Generic Auth Exception: $e.toString()");
          showSnackBar("An error occurred. Please try again.", context);
          throw GenericAuthException();
      }
    } catch (e) {
      log("Generic Auth Exception: $e.toString()");
      showSnackBar("An error occurred. Please try again.", context);
      throw GenericAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification({required BuildContext context}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> initialise() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}

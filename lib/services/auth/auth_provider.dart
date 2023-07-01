//THE APP'S DEFITION OF USER AUTHENTICATION

import 'package:gov_track_sa/widgets/widget_barrel.dart';

import 'auth_user.dart';

//Defined the blue print for authentication
abstract class AuthProvider {
  //initialise an auth service (if that specific auth service requires initialisation before being used)
  Future<void> initialise();

  AuthUser? get currentUser;
  Future<AuthUser> logIn(
      {required String email,
      required String password,
      required BuildContext context});
  Future<AuthUser> register(
      {required String email,
      required String password,
      required BuildContext context});
  Future<void> logOut({required BuildContext context});
  Future<void> sendEmailVerification({required BuildContext context});
  Future<void> sendPasswordResetEmail(
      {required BuildContext context, required String email});
}

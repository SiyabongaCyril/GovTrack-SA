import 'package:gov_track_sa/screens/screen_barrel.dart';

import 'auth_provider.dart';
import 'auth_user.dart';
import 'firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  AuthService(this.provider);
  final AuthProvider provider;

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<AuthUser> register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    return await provider.register(
        email: email, password: password, context: context);
  }

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    return await provider.logIn(
        email: email, password: password, context: context);
  }

  @override
  Future<void> logOut({required BuildContext context}) async {
    return await provider.logOut(context: context);
  }

  @override
  Future<void> sendEmailVerification({required BuildContext context}) async {
    return await provider.sendEmailVerification(context: context);
  }

  @override
  Future<void> initialise() async {
    await provider.initialise();
  }
}

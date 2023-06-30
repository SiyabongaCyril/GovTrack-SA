//THE APP'S DEFITION OF USER AUTHENTICATION

import 'package:gov_track_sa/screens/screen_barrel.dart';
import 'package:gov_track_sa/utilities/show_snack_bar.dart';

import 'auth_user.dart';

//Defined the blue print for authentication
abstract class AuthProvider {
  //initialise an auth service (if that specific auth service requires initialisation before being used)
  Future<void> initialise();

  AuthUser? get currentUser;
  Future<AuthUser> logIn({required String email, required String password});
  Future<AuthUser> register({required String email, required String password});
  Future<void> logOut();
  Future<void> sendEmailVerification();
}

// extension AuthProviderErrorHandlingExtension on AuthProvider {
//   void registerAndHandleErrors({required String email, required String password, required context, String text = "Please enter valid details"}) {
//     register(email: email, password: password);
//     showSnackBar(text, context);
//     };
// }


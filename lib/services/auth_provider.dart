import 'package:chatty_app/services/auth_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthProvider {
  // Those are  simply we are creating a class that has properties that already exist in the FireBase.
  // And  we are using only what we need in our app.
  // And basically creating a layer for our app is not talking directly to the FireBase.

  AuthUser? get currentUser;
  Future<AuthUser?> logIn({
    required String email,
    required String password,
  });
  Future<AuthUser?> register({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> initializeApp();
  Future<DocumentReference<Map<String, dynamic>>> add(
      Map<String, dynamic> data);
  Future<QuerySnapshot<Object?>> getMessages([GetOptions? options]);
}

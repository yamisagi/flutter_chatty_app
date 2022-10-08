///? This is the part we are creating,  abstracting the user.
///? Because our UI is not suppose to directly contact the FireBase,
///
import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

/// I am not planning to use this class in the App.

@immutable
class AuthUser {
  final String userEmail;
  const AuthUser({required this.userEmail});

  factory AuthUser.fromFirebase(User user) => AuthUser(
        userEmail: user.email ?? '',
      );
}

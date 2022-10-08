import 'package:chatty_app/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:firebase_core/firebase_core.dart';

import 'auth_user.dart';

import 'auth_provider.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    // This is the factory constructor for the AuthUser class.
    // It is returning a user object from core.
    // And basic control if user is not null then return instance of AuthUser or null.
    return user != null ? AuthUser.fromFirebase(user) : null;
  }

  @override
  Future<AuthUser?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      return user ?? (throw UserNotFoundAuthException());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;
    user != null
        ? await FirebaseAuth.instance.signOut()
        : throw UserNotLoggedInAuthException();
  }

  @override
  Future<AuthUser?> register({
    required String email,
    required String password,
  }) async {
    try {
      // This is the merthod that is used to register a user.
      // It is  calling FireBase to register a user.

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      return user ?? (throw UserNotFoundAuthException());
    } on FirebaseAuthException catch (e) {
      /// This part is handle the exceptions, that we created in the [auth_exceptions.dart].
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyExistsAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;

    user != null
        ? await user.sendEmailVerification()
        : throw UserNotLoggedInAuthException();
  }

  @override
  Future<void> initializeApp() async {
    await Firebase.initializeApp();
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> add(
      Map<String, dynamic> data) async {
    return FirebaseFirestore.instance.collection('messages').add(data);
  }

  @override
  Future<QuerySnapshot<Object?>> getMessages([GetOptions? options]) {
    return FirebaseFirestore.instance.collection('messages').get(options);
  }
}

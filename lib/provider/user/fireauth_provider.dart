import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/utils/snackbar.dart';

class FireAuthProvider extends StateNotifier<FirebaseAuth> {
  FireAuthProvider(state) : super(state);

  User? get getUser => state.currentUser;

  Future<bool> signIn(String email, String password) async {
    final res = await state
        .signInWithEmailAndPassword(email: email, password: password)
        .onError((error, stackTrace) {
      makeErrorSb('Error signing in', '$error');
      throw Exception;
    });

    if (res.user == null) {
      return false;
    }

    makeSuccessSb('Signed in', 'Successfully signed in');

    return true;
  }

  Future<void> signOut() async {
    await state.signOut().onError((error, stackTrace) =>
        makeErrorSb('Error while signing out', '$error'));
  }

  Future<void> changePassword(String password) async {
    await state.currentUser?.updatePassword(password).onError(
        (error, stackTrace) =>
            makeErrorSb('Error while changing password', '$error'));

    makeSuccessSb('Password changed', 'Successfully changed password');
  }

  Future<void> changeEmail(String email) async {
    await state.currentUser!.updateEmail(email).onError((error, stackTrace) =>
        makeErrorSb('Error while changing email', '$error'));

    makeSuccessSb('Email verification', 'Check your email');
  }

  Future<void> reAuth(String email, String password) async {
    final credential =
        EmailAuthProvider.credential(email: email, password: password);

    try {
      await state.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      makeErrorSb('Error while re-authenticating', '$e');
    }
  }
}

import 'package:flutter/material.dart';
import '../Config/locator.dart';
import '../Models/UserModel.dart';
import 'AuthBase.dart';
import 'FirebaseAuthService.dart';
import 'FirestoreDatabaseService.dart';

class Repository extends ChangeNotifier implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final FirestoreDatabaseService _firestoreDatabaseService =
      locator<FirestoreDatabaseService>();

  @override
  Future<UserModel> currentUser() async {
    return await _firebaseAuthService.currentUser();
  }

  Future<bool?> saveUser(UserModel user) async {
    return await _firestoreDatabaseService.saveUser(user);
  }

  Future<UserModel?> getUser(String userID) async {
    return await _firestoreDatabaseService.getUser(userID);
  }

  @override
  Future<UserModel> signInWithGoogle(BuildContext context) async {
    return await _firebaseAuthService.signInWithGoogle(context);
  }

  @override
  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
  }
}

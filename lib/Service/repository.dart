import 'package:flutter/material.dart';
import '../Config/locator.dart';
import '../Models/UserModel.dart';
import 'AuthBase.dart';
import 'MockAuthService.dart';
import 'FirebaseAuthService.dart';
import 'FirestoreDatabaseService.dart';

enum DatabaseMode { FAKEDB, FIREBASEDB }

class Repository extends ChangeNotifier implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final FirestoreDatabaseService _firestoreDatabaseService =
      locator<FirestoreDatabaseService>();
  final MockAuthService _fakeAuthService = locator<MockAuthService>();
  final DatabaseMode _databaseMode = DatabaseMode.FIREBASEDB;

  @override
  Future<UserModel> currentUser() async {
    if (_databaseMode == DatabaseMode.FIREBASEDB) {
      return await _firebaseAuthService.currentUser();
    } else {
      return await _fakeAuthService.currentUser();
    }
  }

  Future<bool?> saveUser(UserModel user) async {
    if (_databaseMode == DatabaseMode.FIREBASEDB) {
      return await _firestoreDatabaseService.saveUser(user);
    } else {
      return null;
    }
  }

  Future<UserModel?> getUser(String userID) async {
    if (_databaseMode == DatabaseMode.FIREBASEDB) {
      return await _firestoreDatabaseService.getUser(userID);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel> signInWithGoogle(BuildContext context) async {
    if (_databaseMode == DatabaseMode.FIREBASEDB) {
      return await _firebaseAuthService.signInWithGoogle(context);
    } else {
      return await _fakeAuthService.signInWithGoogle(context);
    }
  }

  @override
  Future<bool> signOut() async {
    if (_databaseMode == DatabaseMode.FIREBASEDB) {
      return await _firebaseAuthService.signOut();
    } else {
      return await _fakeAuthService.signOut();
    }
  }
}

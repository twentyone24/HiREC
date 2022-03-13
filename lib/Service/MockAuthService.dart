import 'package:flutter/cupertino.dart';

import 'AuthBase.dart';
import '../Models/UserModel.dart';

class MockAuthService implements AuthBase {
  @override
  Future<UserModel> currentUser() async {
    return await Future.value(
        UserModel(userID: "fakeCurrentUserID", email: "fakeuser@fake.com"));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<UserModel> signInWithGoogle(BuildContext context) async {
    return await Future.delayed(
        const Duration(seconds: 2),
        () => UserModel(
            userID: "googleFakeUserID_123456", email: "fakeuser@fake.com"));
  }
}

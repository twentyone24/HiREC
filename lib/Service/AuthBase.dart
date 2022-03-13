import 'package:flutter/cupertino.dart';
import '../Models/UserModel.dart';

abstract class AuthBase {
  Future<UserModel> currentUser();
  Future<bool> signOut();
  Future<UserModel> signInWithGoogle(BuildContext context);
}

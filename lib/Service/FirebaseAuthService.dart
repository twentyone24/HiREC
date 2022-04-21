import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Models/UserModel.dart';
import 'AuthBase.dart';
import 'package:sweetsheet/sweetsheet.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  UserModel _userFromFirebase(User user) {
    return UserModel(userID: user.uid, email: user.email);
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      User _user = _firebaseAuth.currentUser;
      return _userFromFirebase(_user);
    } catch (e) {
      if (kDebugMode) {
        print("CurrentUser Error: ${e.toString()}");
      }
      return UserModel(userID: "", email: "");
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("sign out Error:" + e.toString());
      }
      return false;
    }
  }

  @override
  Future<UserModel> signInWithGoogle(BuildContext context) async {
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
    if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
      UserCredential _userCred = await _firebaseAuth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken),
      );
      User _user = _userCred.user;

      // TODO: HANDLE FOR CLG MAIL
      if (_user.email.contains('rajalakshmi')) {
        print(_user.email);
        return _userFromFirebase(_user);
      } else {
        // TODO: show popup
        Fluttertoast.showToast(
            msg: "Only College MailID access is allowed.",
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 4);
        signOut();
        return UserModel(userID: "", email: "");
      }
    } else {
      return UserModel(userID: "", email: "");
    }
  }
}

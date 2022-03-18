import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hirec/View Models/UserViewModel.dart';
import '../Home/HomeScreen.dart';
import 'LoginScreen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);

    if (_userViewModel.state == ViewState.IDLE) {
      if (FirebaseAuth.instance.currentUser != null &&
          _userViewModel.user?.email != "") {
        return const HomeScreen();
      } else {
        return const LoginScreen();
        // return HomeScreen(userModel: _userViewModel.user);
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

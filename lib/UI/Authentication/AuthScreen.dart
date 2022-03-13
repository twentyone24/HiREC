import 'package:flutter/material.dart';
import 'package:hirec/View Models/UserViewModel.dart';
import '../../Models/UserModel.dart';
import '../Home/HomeScreen.dart';
import 'LoginScreen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);

    if (_userViewModel.state == ViewState.IDLE) {
      if (_userViewModel.user == null || _userViewModel.user?.email == "") {
        return const LoginScreen();
      } else {
        return const HomeScreen();
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../Config/Theme.dart';
import '../../Models/UserModel.dart';
import '../../View Models/UserViewModel.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  const LoginScreen({Key? key}) : super(key: key);

  void _signInWithGoogle(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    try {
      UserModel _user = await _userViewModel.signInWithGoogle(context);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("signInWithGoogle Error :" + e.message.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('./assets/images/loginBG.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: const BorderSide(
                            color: ThemeColors.green, width: 2),
                      ),
                    ),
                  ),
                  onPressed: () => _signInWithGoogle(context),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset(
                        './assets/images/GIcon.png',
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Sign in with Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeColors.green,
                          fontSize: 20,
                          // fontFamily: 'Avenir',
                          // fontWeight: FontWeight.bold,
                          // letterSpacing: 0.66,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ],
      ),
    );
  }
}

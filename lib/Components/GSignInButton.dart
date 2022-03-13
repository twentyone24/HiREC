import 'package:hirec/Config/Theme.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key, this.padding, this.press, this.textStyle})
      : super(key: key);
  final TextStyle? textStyle;
  final Function? press;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(padding ??
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: const BorderSide(color: ThemeColors.green, width: 2),
          ),
        ),
      ),
      onPressed: press as void Function()?,
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
    );
  }

  Widget googleSignInButton(BuildContext ctx) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: Center(
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(padding ??
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            backgroundColor:
                MaterialStateProperty.all<Color>(ThemeColors.green),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(color: ThemeColors.green),
              ),
            ),
          ),
          onPressed: press as void Function()?,
          child: Ink(
            color: const Color(0xFF397AF3),
            child: Padding(
              padding: const EdgeInsets.all(6),
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
                      fontSize: 18,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.66,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../Config/Theme.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key, this.text, this.press, this.textStyle})
      : super(key: key);
  final String? text;
  final TextStyle? textStyle;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (56),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: ThemeColors.themeGradient,
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: press as void Function()?,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
              ),
              Text(
                text!,
                style: const TextStyle(
                  fontSize: (18),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

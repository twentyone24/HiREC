import 'package:flutter/material.dart';

import '../../Config/Theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, this.text, this.press, this.textStyle})
      : super(key: key);
  final String? text;
  final TextStyle? textStyle;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: ThemeColors.green,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: textStyle ??
              const TextStyle(
                fontSize: (18),
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

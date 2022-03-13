import 'package:flutter/material.dart';

class ThemeColors {
  static const Color green = Color(0xff3586FF);
  static const Color grey = Color(0xff666666);
  static const Color offerColor = Color(0xffF88922);
  static const LinearGradient pinkWhiteGrad = LinearGradient(
    colors: [Color(0xffFCA785), Color(0xffFA5769)],
    begin: Alignment.topLeft,
    end: Alignment(1, 1),
    tileMode: TileMode.repeated,
  );
  static const LinearGradient themeGradient = LinearGradient(
    colors: [Color(0xff3586FF), Color(0xff091425)],
    begin: Alignment.topLeft,
    end: Alignment(1, 1),
    tileMode: TileMode.repeated,
  );
}

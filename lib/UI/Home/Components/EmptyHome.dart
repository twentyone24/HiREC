import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoRentalsBuilder extends StatelessWidget {
  const NoRentalsBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/lottie/cycle.json',
            repeat: true,
            reverse: false,
            animate: true,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Nothing to show here.\nRent a cycle near by?\n",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: (18),
              fontWeight: FontWeight.w500,
            ),
          ),
          // const SizedBox(
          //   height: 15,
          // ),
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          //   child: ScanButton(
          //     text: "RENT NOW",
          //     press: () {},
          //   ),
          // )
        ],
      ),
    );
  }
}

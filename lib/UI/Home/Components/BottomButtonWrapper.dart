import 'package:flutter/cupertino.dart';

import '../../../Components/ScanButton.dart';

class BottomScanButton extends StatelessWidget {
  const BottomScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(
              color: Color(0x55CECECE),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0x55737373),
                      // gradient: ThemeColors.green,
                      borderRadius: BorderRadius.circular(30.0)),
                  width: 40.0,
                  height: 8.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Center(
                  child: ScanButton(
                    text: "Scan Now",
                    press: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          )),
    );
  }
}

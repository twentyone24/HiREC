import 'package:barcode_scan2/barcode_scan2.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../Components/ScanButton.dart';

class BottomScanButton extends StatefulWidget {
  const BottomScanButton({Key? key}) : super(key: key);

  @override
  State<BottomScanButton> createState() => _BottomScanButtonState();
}

class _BottomScanButtonState extends State<BottomScanButton> {
  Future _scanQR() async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      setState(() {
        // result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          if (kDebugMode) {
            print("CAMERA permission denied!");
          }
          // result = "CAMERA permission denied!";
        });
      } else {
        setState(() {
          if (kDebugMode) {
            print("$ex Error occurred.");
          }
          // result = "$ex Error occurred.";
        });
      }
    } on FormatException {
      setState(() {
        if (kDebugMode) {
          print("Nothing scanned!");
        }
        // result = "Nothing scanned!";
      });
    } catch (ex) {
      setState(() {
        if (kDebugMode) {
          print("$ex Error occured.");
        }
        // result = "$ex Error occured.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.zero,
      bottom: false,
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
                    press: () {
                      _scanQR();
                    },
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

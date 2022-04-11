import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../Models/UserModel.dart';
import '../../View Models/UserViewModel.dart';
import 'Components/BottomButtonWrapper.dart';
import 'Components/EmptyHome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _signOut() async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    try {
      bool _ = await _userViewModel.signOut();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("signOut Error :" + e.message.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        toolbarTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 24,
          color: Color(0xff363636),
        ),
        title: const Text(
          "HiREC",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Color(0xff363636),
          ),
        ),
      ),
      body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Column(
            children: [
              if (true) const NoRentalsBuilder(),
              if (false)
                // ignore: dead_code
                Expanded(
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
                        child: Text(
                          "Current Cycles",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _signOut();
                        },
                        child: const Text(
                          "Current Cycles",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
        Column(
          children: const [
            Spacer(),
            BottomScanButton(),
          ],
        ),
      ]),
    );
  }
}

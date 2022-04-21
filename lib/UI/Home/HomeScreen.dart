// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../Models/UserModel.dart';
import '../../Service/FirebaseAuthService.dart';
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
    // _getUserDetails();
  }

  UserModel? _user;

  void _getUserDetails() async {
    try {
      var docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.phoneNumber
              .toString()
              .substring(3))
          .get();
      _user = UserModel.fromFirebaseDoc(docSnapshot);
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: "Network issue. Please check your network.");
      print(e.message);
      rethrow;
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: "Network issue. Please check your network.");
      print(e.message);
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Some error occured");

      rethrow;
    }
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

  Future<void> getUser(UserViewModel _userViewModel) async {
    _user = await _userViewModel.currentUser();
    print(_user);
  }

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    // getUser(_userViewModel);
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
        title: TextButton(
          onPressed: () {
            _signOut();
          },
          child: const Text(
            "HiREC",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: Color(0xff363636),
            ),
          ),
        ),
      ),
      body: Container(
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
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
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/BottomButtonWrapper.dart';

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
              Expanded(
                child: ListView(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
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

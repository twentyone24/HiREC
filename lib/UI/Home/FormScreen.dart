// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import '../../Config/Theme.dart';
import 'HomeScreen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var rentPrice = 25;

  @override
  void initState() {
    super.initState();
  }

  var hoursSelected = 0.0;
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
      body: (SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color.fromARGB(255, 229, 232, 242),
                  ),
                  onPressed: () => {},
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                          child:
                              Text("Rent the cycle $hoursSelected Hour(s).")),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (hoursSelected != 0.5) {
                          setState(() {
                            hoursSelected -= 0.5;
                          });
                        }
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "$hoursSelected",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (hoursSelected != 5) {
                          setState(() {
                            hoursSelected += 0.5;
                          });
                        }
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(),
                  _orderSummary(),
                  _paymentButton(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  _orderSummary() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "SUB-TOTAL",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Color(0xff515979),
                  ),
                ),
                Text(
                  "₹${rentPrice * hoursSelected}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Color(0xff25D482),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              textDirection: TextDirection.ltr,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(1.4),
                1: FlexColumnWidth(0.8),
                2: FlexColumnWidth(0.8),
              },
              children: [
                const TableRow(children: [
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                ]),
                TableRow(
                  children: [
                    const Text(
                      "Number of hour(s)",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff515979),
                      ),
                    ),
                    const Text(
                      " ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: ThemeColors.grey,
                      ),
                    ),
                    Text(
                      "$hoursSelected hours",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 15,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ],
                ),
                const TableRow(children: [
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                ]),
                TableRow(
                  children: [
                    const Text(
                      "Cost per hour",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff515979),
                      ),
                    ),
                    const Text(
                      " ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: ThemeColors.grey,
                      ),
                    ),
                    Text(
                      "₹$rentPrice",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 15,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ],
                ),
                const TableRow(children: [
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                ]),
                TableRow(
                  children: [
                    Text(
                      "Cost for $hoursSelected hour(s)",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff515979),
                      ),
                    ),
                    Text(
                      "₹$rentPrice X $hoursSelected",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 15,
                        color: ThemeColors.grey,
                      ),
                    ),
                    Text(
                      "₹${rentPrice * hoursSelected}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 15,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ],
                ),
                const TableRow(children: [
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                ]),
                TableRow(
                  children: [
                    const Text(
                      "Total",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff515979),
                      ),
                    ),
                    Container(),
                    Text(
                      "₹${rentPrice * hoursSelected}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 16,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _paymentButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
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
            onPressed: () async {
              await initiatePaytm();
              return;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child:
                      Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
                ),
                Text(
                  "Proceed to payment",
                  style: TextStyle(
                    fontSize: (18),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String orderId = "";
  String? txnToken;
  initiatePaytm() async {
    print("initiates paytm checksum");
    try {
      await generateTxnToken();
      print("token generated $txnToken");
      if (txnToken == null) {
        return;
      }
      var amnt = rentPrice * hoursSelected;
      var response = AllInOneSdk.startTransaction(
        "cURMwf14218926811350",
        orderId,
        "$amnt",
        "$txnToken",
        "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=$orderId",
        true,
        true,
      );
      response.then((value) {
        print(value);
        setState(() {
          result = value.toString();
        });

        // CakesController().placeOrder();
        updateAccountOrder();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Order Placed'),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pop(MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
                },
              ),
            ],
          ),
        );
      }).catchError((onError) async {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Could not complete transaction'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
        if (onError is PlatformException) {
          setState(() {
            result = onError.message.toString() +
                " \n  " +
                onError.details.toString();
          });
        } else {
          setState(() {
            result = onError.toString();
          });
        }
      });
    } catch (err) {
      result = err.toString();
    }
  }

  generateTxnToken() async {
    try {
      orderId = DateTime.now().millisecondsSinceEpoch.toString();
      print("generating txmtoken for $orderId");

      var amnt = rentPrice * hoursSelected;
      final response = await http.post(
          Uri.parse("https://cakeland-paytm.herokuapp.com/generate-txn"),
          body: {
            "orderId": orderId,
            "custId": FirebaseAuth.instance.currentUser!.email,
            "value": "$amnt",
          });
      print(amnt);
      print(response.body);
      Map<dynamic, dynamic> json = jsonDecode(jsonDecode(response.body));
      print(json);
      if (response.statusCode == 200) {
        if (json['body']['resultInfo']['resultMsg'] == "Success") {
          txnToken = json['body']['txnToken'];
          print(txnToken);
          orderId = "ORDERID_" + orderId;
          print(orderId);
          print("===========================");
        } else {
          Fluttertoast.showToast(
              msg: "error: ${json['body']['resultInfo']['resultMsg']}");
        }
      } else {
        Fluttertoast.showToast(msg: "payment failed! please try later");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  String result = "No payment status";

  updateAccountOrder() async {
    // await FirebaseFirestore.instance
    // .collection("users")
    // .doc(FirebaseAuth.instance.currentUser!.uid)
    // .update({
    // TODO: UPDATE FIREBASE
    // "RewardPoints": FieldValue.increment(-(CurrentOrder().redeemPointsUsed)),
    // "totalMoneySaved": FieldValue.increment(CurrentOrder().offerAmount),
    // "totalOrdersMade": FieldValue.increment(1),
    // });
  }
}

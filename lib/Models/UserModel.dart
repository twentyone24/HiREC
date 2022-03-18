import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userID;
  String email;
  String? username;
  String? profileURL;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({required this.userID, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'username': username ??
          email.substring(0, email.indexOf('@')) + _createRandomNum(),
      'profileURL': profileURL ?? 'https://via.placeholder.com/150',
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        username = map['username'],
        profileURL = map['profileURL'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate();

  String _createRandomNum() {
    int randomNum = Random().nextInt(999999);
    return randomNum.toString();
  }
}

getField(doc, field) {
  try {
    return (doc.data() as Map).containsKey(field)
        ? (doc.data() as Map)[field]
        : null;
  } catch (e) {
    return null;
  }
}

// ignore_for_file: file_names, constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Config/locator.dart';
import '../Models/UserModel.dart';
import '../Service/AuthBase.dart';
import '../Service/repository.dart';

enum ViewState { IDLE, BUSY }

class UserViewModel extends ChangeNotifier implements AuthBase {
  ViewState _viewState = ViewState.IDLE;
  final Repository _repository = locator<Repository>();

  UserModel? _userModel;
  String? wrongEmailMessage;
  String? wrongPasswordMessage;

  UserModel? get user => _userModel;

  ViewState get state => _viewState;

  set state(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      _viewState = ViewState.BUSY;
      _userModel = await _repository.currentUser();
      notifyListeners();
      if (_userModel != null) {
        return _userModel!;
      } else {
        return UserModel(userID: "", email: "");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Currentuser Error at UserViewModel: " + e.toString());
      }
      return UserModel(userID: "", email: "");
    } finally {
      _viewState = ViewState.IDLE;
      notifyListeners();
    }
  }

  Future<Object?> saveUser(UserModel user) async {
    try {
      return await _repository.saveUser(user);
    } catch (e) {
      if (kDebugMode) {
        print("saveUser Error at UserViewModel: " + e.toString());
      }
      return UserModel(userID: "", email: "");
    }
  }

  Future<UserModel?> getUser(String userID) async {
    try {
      return await _repository.getUser(userID);
    } catch (e) {
      if (kDebugMode) {
        print("getUser Error at UserViewModel: " + e.toString());
      }
      return UserModel(userID: "", email: "");
    }
  }

  @override
  Future<UserModel> signInWithGoogle(BuildContext context) async {
    try {
      _viewState = ViewState.BUSY;
      notifyListeners();
      _userModel = await _repository.signInWithGoogle(context);
      if (_userModel != null) {
        // TODO: VALIDATE IF ONLY REC OR NOT.
        if (_userModel!.email.contains('rajalakshmi')) {
          if (kDebugMode) {
            print("userModel signInWithGoogle at UserViewModel $_userModel");
          }
          _repository.saveUser(_userModel!);
          return _userModel!;
        } else {
          return UserModel(userID: "", email: "");
        }
      } else {
        return UserModel(userID: "", email: "");
      }
    } catch (e) {
      if (kDebugMode) {
        print("signInWithGoogle Error at UserViewModel: " + e.toString());
      }
      return UserModel(userID: "", email: "");
    } finally {
      _viewState = ViewState.IDLE;
      notifyListeners();
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      _viewState = ViewState.BUSY;
      notifyListeners();
      bool _result = await _repository.signOut();
      _userModel = null;
      return _result;
    } catch (e) {
      if (kDebugMode) {
        print("signOut Error at UserViewModel: " + e.toString());
      }
      return false;
    } finally {
      _viewState = ViewState.IDLE;
      notifyListeners();
    }
  }
}

// Text('This app can only be accessed within the Rajalakshmi Engineering college students. If you\'re, please continue with your college mail id.'),
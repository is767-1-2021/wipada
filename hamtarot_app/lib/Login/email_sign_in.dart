import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmailSignInProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isLogin = true;
  String _userEmail = '';
  String _userPassword = '';
  String _userName = '';
  DateTime _dateOfBirth = DateTime.now();

/*
  EmailSignInProvider() {
    _isLoading = false;
    _isLogin = true;
    _userEmail = '';
    _userPassword = '';
    _userName = '';
    _dateOfBirth = DateTime.now();
  }*/

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  String get userPassword => _userPassword;

  set userPassword(String value) {
    _userPassword = value;
    notifyListeners();
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  DateTime get dateOfBirth => _dateOfBirth;

  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  Future<bool> login() async {
    try {
      isLoading = true;

      print(userEmail);
      print(userPassword);

      if (isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
        );
      }

      isLoading = false;
      return true;
    } catch (err) {
      print(err);
      isLoading = false;
      return false;
    }
  }

  //void logout() async {
  // FirebaseAuth.instance.signOut();
  // }
}

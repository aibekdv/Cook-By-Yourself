import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const yellowColor = Color(0xffF2B705);
const greenColor = Color(0xff618c03);
const greyColor = Color(0xffBFD4DB);
const textColor = Color(0xff484747);

const apiUrl = 'http://34.159.203.12';

class RouteConst {
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String resetPassword = 'resetPassword';
  static const String favoritePage = 'favoritePage';
  static const String cartPage = 'cartPage';
  static const String profilePage = 'profilePage';
  static const String settingsPage = 'settingsPage';
  static const String cookingPage = 'cookingPage';
}

void toast({required String msg, bool isError = false}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? Colors.red : yellowColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

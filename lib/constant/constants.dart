import 'package:flutter/material.dart';

class Constants {
  //-------------STRINGS----------------

  static const String welcomeText = 'Welcome to Chatty';
  static const String welcomeSubText =
      'Please register or if you already have an account, log in';
  static const String registerText = 'Register';
  static const String logInText = 'Log-In';
  static const String splashImg = 'assets/splash.png';
  // ---------------RADIUS&PADDING----------------
  static const buttonPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 5,
  );
  static const Radius radius = Radius.circular(20);
  // ---------------COLORS----------------
  static const Color scaffoldColor = Colors.white;
  static final Color bottomColor = Colors.blueGrey.shade700;
}

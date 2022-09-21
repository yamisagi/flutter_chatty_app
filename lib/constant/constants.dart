import 'package:flutter/material.dart';

class Constants {
  //-------------STRINGS----------------

  static const String welcomeText = 'Welcome to Chatty';
  static const String funText = 'Fun';
  static const String startChatText = 'Register to start chatting';
  static const String welcomeSubText =
      'Please register or if you already have an account, log in';
  static const String registerText = 'Register';
  static const String logInText = 'Log-In';
  static const String splashImg = 'assets/splash.png';
  static const String registerMessage = 'One step away from ';
  static const String enterEmail = 'Enter your email';
  static const String enterPassword = 'Enter your password';
  static const String forgotPassword = 'Forgot Password ?';
  static const String typeMessage = 'Type a message';

  // ---------------RADIUS&PADDING----------------

  static const buttonPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 5,
  );
  static const Radius radius = Radius.circular(20);
  static const BorderRadius registerRadius = BorderRadius.only(
    topLeft: Radius.circular(60),
    topRight: Radius.circular(60),
  );
  static const EdgeInsets textFieldPadding =
      EdgeInsets.symmetric(horizontal: 30);
  static const BorderRadius textFieldRadius =
      BorderRadius.all(Radius.circular(12));

  // ---------------COLORS----------------

  static const Color scaffoldColor = Colors.white;
  static final Color bottomColor = Colors.deepPurple.shade300;
  static final Color registerContainerColor = Colors.deepPurple.shade300;
  static const Color registerBottomColor = Colors.white;
  static const Color textFieldBackground = Colors.black38;
  static final Color buttonColor = Colors.deepPurple.shade600;

  // -----------------STYLES----------------
  
  static const TextStyle coloredTextStyle = TextStyle(
    fontSize: 70.0,
    fontWeight: FontWeight.bold,
  );
}

// ignore_for_file: use_build_context_synchronously

import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/common/animated_texts.dart';
import 'package:chatty_app/product/common/bottom_widget.dart';
import 'package:chatty_app/product/common/show_dialog.dart';
import 'package:chatty_app/services/firebase_exceptions.dart';
import 'package:chatty_app/services/firebase_service.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final auth = FirebaseAuthProvider();
  String email = '';
  String password = '';
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final String _errorMessage = 'Something Bad Happened :/';

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.registerContainerColor,
      ),
      backgroundColor: Constants.scaffoldColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Constants.registerContainerColor,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: const [
                AnimatedTextWidget(),
                // Maybe we can add a logo here or something else to make it more beautiful
              ],
            ),
          ),
          BottomWidget(
            emailChanged: (email) => this.email = email,
            passwordChanged: (password) => this.password = password,
            heroTag: 'login',
            onPressed: () async {
              try {
                showDialog(
                  context: context,
                  builder: ((context) => const Center(
                        child: CircularProgressIndicator(),
                      )),
                );
                await auth.logIn(
                  email: email,
                  password: password,
                );

                Navigator.of(context).pushReplacementNamed('/chat');
              } on UserNotFoundAuthException {
                await fireShowDialog(
                  title: 'User Not Found',
                  context,
                  content: 'Check Your Email and Password',
                );
              } on WrongPasswordAuthException {
                await fireShowDialog(
                  title: 'Wrong Password',
                  context,
                  content: 'Check Your Email or Password',
                );
              } on GenericAuthException {
                await fireShowDialog(
                  title: 'Error',
                  context,
                  content: _errorMessage,
                );
              }
            },
            buttonText: Constants.logInText,
            emailController: _emailController,
            passwordController: _passwordController,
          )
        ],
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'dart:developer';

import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/common/animated_texts.dart';
import 'package:chatty_app/product/common/bottom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.registerContainerColor,
        ),
        backgroundColor: Constants.registerContainerColor,
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
              heroTag: 'register',
              onPressed: () async {
                // We will add the logic here later implementation
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (newUser != null) {
                    Navigator.pushNamed(context, '/chat');
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    log('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    log('The account already exists for that email.');
                  } else if (e.code == 'invalid-email') {
                    log('The email is invalid');
                  }
                } on Exception catch (e) {
                  log(e.toString());
                }
              },
              buttonText: Constants.registerText,
              emailController: _emailController,
              passwordController: _passwordController,
            )
          ],
        ));
  }
}

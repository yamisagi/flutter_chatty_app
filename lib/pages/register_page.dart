// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/common/animated_texts.dart';
import 'package:chatty_app/product/common/bottom_widget.dart';
import 'package:chatty_app/product/common/show_dialog.dart';
import 'package:chatty_app/services/firebase_exceptions.dart';
import 'package:chatty_app/services/firebase_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final auth = FirebaseAuthProvider();
  final String _errorMessage = 'Something Bad Happened :/';
  String email = '';
  String password = '';
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

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
                try {
                  //* We are using FireBaseAuth to create user.
                  //* And here we are waiting for the Future.
                  await auth.register(
                    email: email,
                    password: password,
                  );

                  Navigator.of(context).pushNamed('/chat');
                } on EmailAlreadyExistsAuthException {
                  await fireShowDialog(
                    context,
                    title: 'Try New Username',
                    content: 'Please Try Another Username',
                  );
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                } on InvalidEmailAuthException {
                  await fireShowDialog(
                    context,
                    title: 'Invalid Email',
                    content: 'Please Use Valid Email',
                  );
                } on WeakPasswordAuthException {
                  await fireShowDialog(
                    context,
                    title: 'Try New Password',
                    content: 'Please Try Another Password',
                  );
                } on GenericAuthException {
                  await fireShowDialog(
                    context,
                    title: 'Error',
                    content: _errorMessage,
                  );
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

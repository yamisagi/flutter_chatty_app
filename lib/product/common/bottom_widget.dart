import 'dart:developer';

import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/pages/chat_page.dart';
import 'package:chatty_app/product/common/textfield_widget.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.buttonText,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Constants.registerBottomColor.withOpacity(0.8),
          borderRadius: Constants.registerRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFieldWidget(
              controller: _emailController,
              hintText: Constants.enterEmail,
              isPassword: false,
            ),
            TextFieldWidget(
              controller: _passwordController,
              hintText: Constants.enterPassword,
              isPassword: true,
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Add login function

                // This is just for testing fake login
                (_emailController.text == 'admin' &&
                        _passwordController.text == 'admin')
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatPage(),
                        ))
                    : log('Wrong email or password');
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Constants.registerBottomColor.withOpacity(0.4),
                padding: Constants.buttonPadding,
              ),
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Constants.registerContainerColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: (() {}),
              style: TextButton.styleFrom(
                enableFeedback: false,
              ),
              child: Text(
                Constants.forgotPassword,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Constants.registerContainerColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

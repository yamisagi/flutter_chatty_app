import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/common/animated_texts.dart';
import 'package:chatty_app/product/common/bottom_widget.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              buttonText: Constants.logInText,
              emailController: _emailController,
              passwordController: _passwordController,
            )
          ],
        ));
  }
}

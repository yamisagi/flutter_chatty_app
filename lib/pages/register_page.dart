import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/register_page/animated_texts.dart';
import 'package:chatty_app/product/register_page/register_bottom.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            RegisterBottomWidget(
              emailController: _emailController,
              passwordController: _passwordController,
            )
          ],
        ));
  }
}

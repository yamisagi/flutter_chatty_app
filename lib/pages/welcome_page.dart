import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/welcome_page/welcome_bottom.dart';
import 'package:chatty_app/product/welcome_page/welcome_top.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: const [
            WelcomeTopWidget(),
            WelcomeBottomWidget(),
          ],
        ),
      ),
    );
  }
}

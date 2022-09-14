import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/welcome_page/welcome_bottom.dart';
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
          children: [
            Positioned(
              // Would be 45 for fitting the image but I wanted to see little bit of the white line :) 
              top: MediaQuery.of(context).devicePixelRatio * 44,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Constants.radius),
                  image: DecorationImage(
                    image: AssetImage(Constants.splashImg),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const WelcomeBottomWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:chatty_app/constant/colors.dart';
import 'package:chatty_app/constant/constants.dart';
import 'package:flutter/material.dart';

class WelcomeBottomWidget extends StatelessWidget {
  const WelcomeBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ProductColors.bottomColor,
          borderRadius: const BorderRadius.only(
            topLeft: Constants.radius,
            topRight: Constants.radius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              Constants.welcomeText,
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              Constants.welcomeSubText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontSize: 18,
                  ),
            ),
            ElevatedButton(
              style: Constants.buttonStyle,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/register',
                );
              },
              child: Text(
                Constants.registerText,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: Constants.buttonStyle,
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: Text(
                'Log in',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: ProductColors.regularWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

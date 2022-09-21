import 'package:chatty_app/constant/constants.dart';
import 'package:flutter/material.dart';

class WelcomeTopWidget extends StatelessWidget {
  const WelcomeTopWidget({
    required this.height,
    Key? key,
  }) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Would be 45 for fitting the image but I wanted to see little bit of the white line :)
      top: MediaQuery.of(context).devicePixelRatio * 44,
      left: 0,
      right: 0,
      child: Container(
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Constants.radius),
          image: DecorationImage(
            image: AssetImage(Constants.splashImg),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

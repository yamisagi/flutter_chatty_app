import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatty_app/constant/constants.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: true,
      animatedTexts: [
        WavyAnimatedText(
          Constants.welcomeText,
          speed: const Duration(milliseconds: 200),
          textStyle: Theme.of(context).textTheme.headline3?.copyWith(
              color: Constants.registerBottomColor,
              fontWeight: FontWeight.bold),
        ),
        WavyAnimatedText(
          Constants.registerMessage,
          speed: const Duration(milliseconds: 200),
          textStyle: Theme.of(context).textTheme.headline4?.copyWith(
                color: Constants.registerBottomColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        ColorizeAnimatedText(
          Constants.funText,
          textStyle: Constants.coloredTextStyle,
          colors: [
            Colors.white,
            Colors.deepOrangeAccent,
            Colors.yellow,
            Colors.red,
          ],
        ),
      ],
      repeatForever: true,
    );
  }
}

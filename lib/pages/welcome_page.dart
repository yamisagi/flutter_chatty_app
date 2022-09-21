import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/welcome_page/welcome_bottom.dart';
import 'package:chatty_app/product/welcome_page/welcome_top.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
// When we have just one AnimationController, we can use the  SingleTickerProviderStateMixin
// But when we have more than one AnimationController, we can use the  TickerProviderStateMixin

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    // When we ve done with the AnimationController, we have to dispose it
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldColor.withOpacity(_controller.value),
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

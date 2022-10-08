import 'package:chatty_app/constant/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> fireShowDialog(BuildContext context,
    {required String title, required String content}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      // IDK it would be better color for this :/
      backgroundColor: Colors.black54, // Colors.white.withOpacity(0.9),
      title: Center(
          child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: ProductColors.buttonColor,
        ),
      )),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: ProductColors.buttonColor,
            backgroundColor: Colors.transparent,
            enableFeedback: false,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Center(
            child: Text(
              'Ok',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    ),
  );
}

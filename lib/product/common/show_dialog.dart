import 'package:flutter/material.dart';

Future<dynamic> fireShowDialog(BuildContext context,
    {required String title, required String content}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    ),
  );
}
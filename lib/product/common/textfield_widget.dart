import 'package:chatty_app/constant/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final Function(String)? onChanged;
  final TextEditingController controller;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Constants.textFieldPadding,
      decoration: const BoxDecoration(
        color: Constants.textFieldBackground,
        borderRadius: Constants.textFieldRadius,
      ),
      child: TextField(
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: true,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Constants.scaffoldColor,
                fontWeight: FontWeight.bold,
              ),
          label: Text(
            hintText,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          prefixIcon: Icon(
            isPassword ? Icons.password : Icons.email,
            color: Constants.registerBottomColor,
          ),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

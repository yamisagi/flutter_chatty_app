import 'dart:developer';

import 'package:chatty_app/constant/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  void checkUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Add logout function
              // Fake logout for testing
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white.withOpacity(0.2),
              height: MediaQuery.of(context).size.height * 0.8,
              child: const Center(
                child: Text('Chats Will Be Here'),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Constants.typeMessage,
                      contentPadding: Constants.buttonPadding,
                    ),
                  ),
                ),
                Hero(
                  tag: 'login',
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    padding: Constants.buttonPadding,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

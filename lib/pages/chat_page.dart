import 'dart:developer';

import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/services/auth_user.dart';
import 'package:chatty_app/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final _textController;
  final _auth = FirebaseAuthProvider();

  AuthUser? loggedInUser;

  void getMessages() async {
    final messages = await _auth.getMessages();
    for (var message in messages.docs) {
      log(message.data().toString());
    }
  }

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
  void initState() {
    super.initState();
    _textController = TextEditingController();
    checkUser();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                getMessages();
                // await _auth.logOut();
                // Navigator.of(context).pop();
              } on Exception catch (e) {
                log(e.toString());
              }
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
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
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
                    onPressed: () async {
                      _auth.add({
                        'text': _textController.text,
                        'sender': loggedInUser!.userEmail,
                      });
                      _textController.clear();
                    },
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

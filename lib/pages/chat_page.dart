// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:developer';

import 'package:chatty_app/constant/constants.dart';
import 'package:chatty_app/product/chat_page/message_buble.dart';
import 'package:chatty_app/services/auth_user.dart';
import 'package:chatty_app/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                await _auth.logOut();
                Navigator.of(context).pop();
              } on Exception catch (e) {
                log(e.toString());
              }
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                final messages = snapshot.data;
                final messageBubbles = <MessageBubble>[];
                for (var message in messages!.docs.reversed) {
                  final userMessage = message.data() as Map<String, dynamic>;
                  final messageText = userMessage['text'];
                  final messageSender = userMessage['sender'];
                  final timestamp = userMessage['timestamp'];
                  final currentUser = loggedInUser!.userEmail;
                  final messageBubble = MessageBubble(
                      text: messageText,
                      sender: messageSender,
                      isMe: currentUser == messageSender,
                      timestamp: timestamp ?? Timestamp.now());
                  messageBubbles.add(messageBubble);
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    padding: Constants.chatBubbleRadius,
                    children: messageBubbles,
                  ),
                );
              } else {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
            stream: _auth.snapshots(),
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
                    if (_textController.text.isNotEmpty) {
                      _auth.add({
                        'text': _textController.text,
                        'sender': loggedInUser!.userEmail,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                      _textController.clear();
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

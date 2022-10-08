import 'package:chatty_app/constant/colors.dart';
import 'package:chatty_app/constant/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    this.text,
    this.sender,
    this.isMe,
    this.timestamp,
  }) : super(key: key);

  final String? text;
  final String? sender;
  final bool? isMe;
  final Timestamp? timestamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender!, style: Constants.stamps),
          Material(
            elevation: 5,
            shadowColor: Colors.white24,
            borderRadius: isMe!
                ? Constants.myChatBubbleRadius
                : Constants.otherChatBubbleRadius,
            color:
                isMe! ? ProductColors.buttonColor : ProductColors.regularWhite,
            child: Padding(
              padding: Constants.bubblePadding,
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 15,
                  color: isMe! ? ProductColors.regularWhite : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Text(DateFormat('dd MMM kk:mm').format(timestamp!.toDate()),
              style: Constants.stamps),
        ],
      ),
    );
  }
}

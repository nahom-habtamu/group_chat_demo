import 'package:flutter/material.dart';

class CurrentUserChatBubble extends StatelessWidget {

  final dynamic senderEmail;
  final dynamic message;
  final dynamic time;

  const CurrentUserChatBubble({ required this.senderEmail, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(top: 55),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Text(
                senderEmail[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            ),
            child: Center(
              child: Text(
                message.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: Text(
              time.toString()
            ),
          )
        ],
      ),
    );
  }
}

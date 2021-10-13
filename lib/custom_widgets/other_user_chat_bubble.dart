import 'package:flutter/material.dart';

class OtherUserChatBubble extends StatelessWidget {

  final dynamic message;
  final dynamic time;

  const OtherUserChatBubble({ required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 25, left: 100),
            child: Text(
                time.toString()
            ),
          ),

          Container(
            width: 200,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.blueGrey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
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
        ],
      ),
    );
  }
}

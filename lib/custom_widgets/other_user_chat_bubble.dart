import 'package:flutter/material.dart';

class OtherUserChatBubble extends StatelessWidget {
  const OtherUserChatBubble();

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
                "18:05"
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
                "Hey There What's Up",
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

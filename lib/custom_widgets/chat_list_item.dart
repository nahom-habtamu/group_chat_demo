import 'package:flutter/material.dart';
import 'package:flutter_group_chat/pages/chat_detail_page.dart';
class ChatListItem extends StatelessWidget {

  final String chatName;
  final String lastMessage;
  final int chatListIndex;

  const ChatListItem({ required this.chatName, required this.lastMessage, required this.chatListIndex });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailPage(chatListIndex),
              )
            );
          },
          splashColor: Colors.blueGrey,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                chatName
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lastMessage
              ),
            ),
            leading: Container(
              padding: const EdgeInsets.all(8.0),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Text(
                  chatName[0],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

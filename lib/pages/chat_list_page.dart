import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat/custom_widgets/chat_list_item.dart';
import 'package:provider/provider.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage();

  @override
  Widget build(BuildContext context) {

    var chatList = Provider.of<List<QueryDocumentSnapshot>>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        centerTitle: true,
        title: Text('Chat List'),
      ),

      body: Column(
        children: [
          Container(
            height: 757,
            child: chatList.length == 0 ? CircularProgressIndicator() :
            ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context,index){
                  return ChatListItem(
                    chatListIndex: index,
                    chatName: chatList[index].data()["name"],
                    lastMessage: chatList[index].data()["messages"][0]["message"],
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

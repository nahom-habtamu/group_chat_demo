import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat/custom_widgets/current_user_chat_bubble.dart';
import 'package:flutter_group_chat/custom_widgets/other_user_chat_bubble.dart';
import 'package:flutter_group_chat/custom_widgets/send_message_widget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_group_chat/services/chat.dart';


class ChatDetailPage extends StatelessWidget {
  ChatDetailPage( this.chatListIndex );
  final int chatListIndex;

  @override
  Widget build(BuildContext context) {

    var messageList = Provider.of<List<dynamic>>(context);
    var user = Provider.of<User?>(context);
    var chat = Provider.of<Chat>(context);

    print(user!.uid);
    print(messageList[0]);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text( "Chat Detail Page"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 680,
              child:

              messageList.isEmpty ? CircularProgressIndicator() :

              ListView.builder(
                  itemCount: messageList[chatListIndex].length,
                  itemBuilder: (context,index){
                    Timestamp timeStamp = messageList[chatListIndex][index]["createdAt"];
                    var date = new DateTime.fromMicrosecondsSinceEpoch(timeStamp.microsecondsSinceEpoch);
                    if( user.uid == messageList[chatListIndex][index]["senderId"].toString()){
                      return OtherUserChatBubble(
                        time: "${ date.hour}:${date.minute}",
                        message: messageList[chatListIndex][index]["message"],
                      );
                    }

                    else {
                      return CurrentUserChatBubble(
                        time: "${ date.hour}:${date.minute}",
                        message: messageList[chatListIndex][index]["message"],
                        senderEmail: messageList[chatListIndex][index]["senderEmail"],
                      );
                    }
                  },
              )
            ),
            SendMessageWidget(
              onInputChanged: () {},
              onMessageSendClicked: () {
                chat.addMessage(chatListIndex, "ME", user.uid, user.email.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}

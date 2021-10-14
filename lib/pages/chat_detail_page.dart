import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat/custom_widgets/current_user_chat_bubble.dart';
import 'package:flutter_group_chat/custom_widgets/other_user_chat_bubble.dart';
import 'package:flutter_group_chat/custom_widgets/send_message_widget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_group_chat/services/chat.dart';


class ChatDetailPage extends StatefulWidget {
  ChatDetailPage( this.chatListIndex );
  final int chatListIndex;

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  var message = "";
  @override
  Widget build(BuildContext context) {

    var messageList = Provider.of<List<dynamic>>(context);
    var user = Provider.of<User?>(context);
    var chat = Provider.of<Chat>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text( "Chat Detail Page"),
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child:
                  messageList.isEmpty ? CircularProgressIndicator() :
                  ListView.builder(
                    itemCount: messageList[widget.chatListIndex].length,
                    itemBuilder: (context,index){
                      Timestamp timeStamp = messageList[widget.chatListIndex][index]["createdAt"];
                      var date = new DateTime.fromMicrosecondsSinceEpoch(timeStamp.microsecondsSinceEpoch);
                      if( user!.uid == messageList[widget.chatListIndex][index]["senderId"].toString()){
                        return CurrentUserChatBubble(
                          time: "${ date.hour}:${date.minute}",
                          message: messageList[widget.chatListIndex][index]["message"],
                        );
                      }

                      else {
                        return OtherUserChatBubble(
                          time: "${ date.hour}:${date.minute}",
                          message: messageList[widget.chatListIndex][index]["message"],
                          senderEmail: messageList[widget.chatListIndex][index]["senderEmail"],
                        );
                      }
                    },
                  )
              ),
            ),
            SingleChildScrollView(
              child: SendMessageWidget(
                value: message,
                onInputChanged: (value) {
                  setState(() {
                    message = value;
                  });
                },
                onMessageSendClicked: () {
                  if(message.length > 0){
                    var tempMessage = message;
                    setState(() {
                      message = "";
                    });
                    chat.addMessage(widget.chatListIndex, tempMessage , user!.uid, user.email.toString());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

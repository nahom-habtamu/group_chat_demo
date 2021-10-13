import 'package:flutter/material.dart';
import 'package:flutter_group_chat/custom_widgets/current_user_chat_bubble.dart';
import 'package:flutter_group_chat/custom_widgets/other_user_chat_bubble.dart';
import 'package:flutter_group_chat/custom_widgets/send_message_widget.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text( 'Chat Detail Page' ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 680,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  if(index % 2 == 0)
                    return OtherUserChatBubble();
                  else
                    return CurrentUserChatBubble();
                },
              )
            ),
            SendMessageWidget(
              onInputChanged: () {},
              onMessageSendClicked: () {},
            ),
          ],
        ),
      ),
    );
  }
}

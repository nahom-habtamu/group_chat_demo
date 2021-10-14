import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Chat with ChangeNotifier {
  final _groupChat = FirebaseFirestore.instance.collection("GroupChats");


  Stream<List<QueryDocumentSnapshot>> get chatList {
    return _groupChat.snapshots().map((element) => element.docs);
  }

  Stream<List<dynamic>> get messageList {
    return _groupChat.snapshots().map((element) => element.docs).map((snaps) => snaps.map((e) => e.data()["messages"]).toList());
  }

  void addMessage(int chatListIndex, String message, String senderId, String senderEmail ) async {

    try {

       QuerySnapshot allData = await _groupChat.get();
       Map<String,dynamic> currentChat = allData.docs[chatListIndex].data();

       var messageToAdd = Map<String,dynamic>();
       messageToAdd["createdAt"] = Timestamp.fromDate(DateTime.now());
       messageToAdd["message"] = message;
       messageToAdd["senderId"] = senderId;
       messageToAdd["senderEmail"] = senderEmail;

       await _groupChat.doc(allData.docs[chatListIndex].id).set({
         ...currentChat,
         "messages" : [
           ...currentChat["messages"],
           messageToAdd
         ]
       });

    }
    catch(e){
      print(e.toString());
    }
  }
  

}

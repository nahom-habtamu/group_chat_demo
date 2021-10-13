import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {
  final _groupChat = FirebaseFirestore.instance.collection("GroupChats");


  Stream<List<QueryDocumentSnapshot>> get chatList {
    return _groupChat.snapshots().map((element) => element.docs);
  }


  void addMessage(String senderId, String senderEmail, String message, String docId) async {

    try {

        dynamic messageToAdd = new Map<String,dynamic>();
          messageToAdd["message"] = message;
          messageToAdd["senderId"] = senderId;
          messageToAdd["senderEmail"] = senderEmail;
          
          
        dynamic dataInDatabase = _groupChat.snapshots().map((event) => )

    }
    catch(e){
      print(e.toString());
    }
  }
  

}

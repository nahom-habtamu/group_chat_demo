import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Chat List'),
      ),

      body: Column(
        children: [
          Container(
            height: 757,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/chatdetail');
                        },
                        splashColor: Colors.blueGrey,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text("Chat Name"),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text("i am the last message"),
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
                                "M",
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
            ),
          )
        ],
      ),
    );
  }
}

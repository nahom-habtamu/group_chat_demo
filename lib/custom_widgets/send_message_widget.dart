import 'package:flutter/material.dart';
class SendMessageWidget extends StatelessWidget {

  final Function onInputChanged;
  final Function onMessageSendClicked;
  const SendMessageWidget({ required this.onInputChanged, required this.onMessageSendClicked });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 50,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Enter Your Message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
            ),
            onChanged: (value){
              onInputChanged(value);
            },
          ),
        ),

        Container(
          width: 100,
          height: 50,
          color: Colors.blueGrey,
          child: TextButton(
            onPressed: () {
              this.onMessageSendClicked();
            },
            child: Center(
              child: Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

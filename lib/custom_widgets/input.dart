import 'package:flutter/material.dart';

class Input extends StatelessWidget {

  final Function onInputChange;
  final String hintText;
  final bool isObsecured;

  const Input({ required this.onInputChange, required this.hintText, this.isObsecured = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        textAlign: TextAlign.center,
        obscureText: this.isObsecured,
        decoration: InputDecoration(
            hintText: this.hintText,
            border: OutlineInputBorder()
        ),
        onChanged: (value){
          onInputChange(value);
        },
      ),
    );
  }
}

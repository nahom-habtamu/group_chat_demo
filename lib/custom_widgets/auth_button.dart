import 'package:flutter/material.dart';
class AuthButton extends StatelessWidget {

  final Function onPressed;
  final String label;

  const AuthButton({ required this.onPressed, required this.label });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      color: Colors.blueGrey,
      child: TextButton(
        onPressed: () {
          this.onPressed();
        },
        child: Center(
          child: Text(
            this.label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}

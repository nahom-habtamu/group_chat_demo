import 'package:flutter/material.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 250,
      child: Center(
        child: Text(
          "Welcome !",
          style: TextStyle(
              fontSize: 55,
              fontStyle: FontStyle.italic,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
